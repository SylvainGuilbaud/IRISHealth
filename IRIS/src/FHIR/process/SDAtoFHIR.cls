/// This business process takes an SDA3 stream as input, enclosed in either an Ens.StreamContainer
/// message or in an HS.Message.XMLMessage message. It transforms the SDA3 into a FHIR Bundle, using
/// the SDA3 to FHIR transformation API class. The version of FHIR to output is determined by the
/// "FHIRMetadataSet" setting on this business process. If TransmissionMode is "transaction",
/// then the Bundle is added to a FHIR request message and forwarded to the business host indicated
/// by Target Config Name. Otherwise, if TransmissionMode is "individual", then the individual
/// resources within the Bundle are each added to separate FHIR request messages and forwarded to
/// Target Config Name.
Class FHIR.process.SDAtoFHIR Extends HS.FHIR.DTL.Util.HC.SDA3.FHIR.Process
{

Property syncTarget As %String(MAXLEN = 200) [ InitialExpression = "BO_SYNC_OSCAR_FHIR" ];

Property LookupTable As %String [ InitialExpression = "fhir-url" ];

// Property FHIRServerCredentials As Ens.Config.Credentials [ InitialExpression = "FHIRServer", Required ];

// Property FHIRServer As %String(MAXLEN = 200) [ InitialExpression = "http://ipc-lorah-webgateway-1/lorah" ];

// Parameter SETTINGS = "FHIRServerCredentials:Basic:credentialsSelector,FHIRServer,TargetConfigName:Basic:selector?context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId},-FHIRVersion,TransmissionMode,FullTransactionResponse,FHIRFormat,FormatFHIROutput,CallbackClass,-ValidResourceRequired,OutputToQuickStream,TransformClass::selector?context={HS.HC.Util.ContextSearch/SubclassOf?class=HS.FHIR.DTL.Util.API.Transform.SDA3ToFHIR},FHIRMetadataSet::selector?context={HS.FHIRServer.Util.ContextSearch/FHIRMetadataSets},FHIREndpoint::selector?context={HS.FHIRServer.Util.ContextSearch/FHIRServerEndpoints}";

Parameter SETTINGS = "LookupTable:OSCAR,syncTarget:OSCAR:selector?context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId},TargetConfigName:Basic:selector?context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId},-FHIRVersion,TransmissionMode,FullTransactionResponse,FHIRFormat,FormatFHIROutput,CallbackClass,-ValidResourceRequired,OutputToQuickStream,TransformClass::selector?context={HS.HC.Util.ContextSearch/SubclassOf?class=HS.FHIR.DTL.Util.API.Transform.SDA3ToFHIR},FHIRMetadataSet::selector?context={HS.FHIRServer.Util.ContextSearch/FHIRMetadataSets},FHIREndpoint::selector?context={HS.FHIRServer.Util.ContextSearch/FHIRServerEndpoints}";

Method UpdateBundle(pBundle As %DynamicObject) As %DynamicObject
{
	try {
		Set tBundle = pBundle
		Set entry = tBundle.entry.%GetIterator()
		Set entryKey = "", entryValue = "" 
		While entry.%GetNext(.entryKey, .entryValue) {
			if entryValue.request.method = "POST" {
				if entryValue.resource.%IsDefined("identifier") {
					set request = ##class(%Net.HttpRequest).%New()	
					$$$ThrowOnError(##class(FHIR.utils).getCredentials(##class(FHIR.utils).getFHIRCredentials(),.credentials))	
					set request.Username = credentials.Username
					set request.Password = credentials.Password
					set request.InitiateAuthentication = "Basic"
					set request.ContentType = "application/fhir+json; charset=UTF-8"
					do request.SetHeader("Accept","*/*")
					set request.Https=1
					set request.Server= ##class(FHIR.utils).getFHIRServer()
					set request.Port=##class(FHIR.utils).getFHIRHTTPSPort()
					set request.SSLConfiguration="ipc"
					set request.SSLCheckServerIdentity=0
					Set url = "https://" _ ##class(FHIR.utils).getFHIRServer() _ ":" _ ##class(FHIR.utils).getFHIRHTTPSPort() _ ##class(FHIR.utils).getFHIRProxyApp() _ ##class(FHIR.utils).getFHIREndpoint() _ "/" _ entryValue.resource.resourceType _ "?identifier=" _ entryValue.resource.identifier.%Get(0).value	
					$$$TRACE("/"_$PIECE(url,"/",4,*))
					$$$ThrowOnError(request.Get(url))
					set response = {}.%FromJSON(request.HttpResponse.Data)
					$$$TRACE(request.HttpResponse.StatusCode_":"_response.%ToJSON())
					Set entryValue.request.method = "PUT"
					Set entryValue.resource.id=##class(FHIR.utils).getResourceId(entryValue.resource.resourceType,entryValue.resource.identifier.%Get(0).value)
					If (request.HttpResponse.StatusCode = 200)
					&& (response.total > 0) {
						if response.%IsDefined("entry") {
							if response.entry.%Get(0).resource.resourceType = entryValue.resource.resourceType {
								if response.entry.%Get(0).resource.id '= "" {
									Set entryValue.resource.id = response.entry.%Get(0).resource.id
									$$$TRACE("<<<RESOURCE FOUND>>> " _ entryValue.resource.resourceType _ " id="_ entryValue.resource.id)
								}
							}
						}
					}
					set entryValue.request.url = entryValue.resource.resourceType _ "/" _ entryValue.resource.id
					if (entryValue.resource.resourceType'="Organization") 
					&& (entryValue.resource.resourceType'="Encounter")
					&& (entryValue.resource.resourceType'="Location")
					&& (entryValue.resource.resourceType'="Practitioner") {
						Set entryValue.fullUrl = entryValue.resource.resourceType _ "/" _ entryValue.resource.id
					}
			}
			}
			If entryValue.request.method = "PUT" {
				set ^FHIRRESOURCES(entryValue.resource.resourceType,entryValue.resource.identifier.%Get(0).value) = entryValue.resource.id
			}
			if entryValue.resource.%IsDefined("extension") {
			Set extension = entryValue.resource.extension.%GetIterator()
			While extension.%GetNext(.extensionKey, .extensionValue) {
				set KeyName = entryValue.resource.resourceType _":"_ extensionValue.url
				set DataValue = "http://hl7.org/fhir/fr/............"
				set sc = ##class(common.utils).addLookupTableEntry(..LookupTable,KeyName,DataValue)
				set extensionValue.url = DataValue
				do entryValue.resource.extension.%Set(extensionKey,extensionValue)
			}
			}
		}
	}  catch exp{
		set sc = exp.AsStatus()
		set tBundle={"Exception ":($system.Status.GetErrorText(sc))}
	}
    
    Return tBundle
}

Method syncOSCAR(pBundle As %DynamicObject) As %Status
{
	try {
		set sc = $$$OK
		set syncRequest = ##class(Ens.StringContainer).%New()
		set syncRequest.StringValue = pBundle.%ToJSON()
		set sc = ..SendRequestAsync(..syncTarget,syncRequest) 
	}  catch exp{
		set sc = exp.AsStatus()
	}
    return sc
}

/// This is an instance method because it needs to SendSync to a business host and get
/// the response from the host.
Method ProcessSDARequest(pSDAStream, pSessionApplication As %String, pSessionId As %String, pPatientResourceId As %String = "") As %Status
{
	New %HSIncludeTimeZoneOffsets
	
	Set %HSIncludeTimeZoneOffsets = 1
	
	Set tSC = $$$OK
	
	Try {
		// Check the base class for the Target business host. Determine if it is
		// a FHIRServer Interop business host or not.
		If '$Data(%healthshare($$$CurrentClass, "isInteropHost"))#10 {
			$$$ThrowOnError(##class(HS.Director).OpenCurrentProduction(.tProdObj))
			Set tClassName = ""
			For i = 1:1:tProdObj.Items.Count() {
				If tProdObj.Items.GetAt(i).Name = ..TargetConfigName {
					Set tClassName = tProdObj.Items.GetAt(i).ClassName
					Quit
				}
			}
			Kill tProdObj
			
			Set tIsInteropHost = 0
			Set tRequiredHostBases("HS.FHIRServer.Interop.Operation") = ""
			Set tRequiredHostBases("HS.FHIRServer.Interop.HTTPOperation") = ""
			Set tHostBase = ""
			For {
				Set tHostBase = $Order(tRequiredHostBases(tHostBase))
				If tHostBase="" Quit
				If $ClassMethod(tClassName, "%IsA", tHostBase) {
					Set tIsInteropHost = 1
					Quit
				}
			}
			Set %healthshare($$$CurrentClass, "isInteropHost") = tIsInteropHost
			
		} Else {
			Set tIsInteropHost = %healthshare($$$CurrentClass, "isInteropHost")
		}
		
		// Get the host and web server port of the current instance, to be used for populating
		// the FHIR request message HOST header.  The HOST header is needed in the FHIR request
		// message when the message is being routed for processing in the local production, as
		// opposed to being passed to an external server.
		Do ..GetHostAndPort(.tHost, .tPort)
		Set tLocalHostAndPort = tHost_$Select(tPort'="":":",1:"")_tPort
		
		If ..FHIRFormat="JSON" {
			Set tMessageContentType = "application/fhir+json"
		} ElseIf ..FHIRFormat="XML" {
			Set tMessageContentType = "application/fhir+xml"
		}
		
		Set tFHIRMetadataSetKey = $ZStrip($Piece(..FHIRMetadataSet, "/", 1), "<>W")
		
		Set tSchema = ##class(HS.FHIRServer.Schema).LoadSchema(tFHIRMetadataSetKey)
		
		If '..FormatFHIROutput {
			Set tIndentChars = ""
			Set tLineTerminator = ""
			Set tFormatter = ""
		} Else {
			Set tIndentChars = $Char(9)
			Set tLineTerminator = $Char(13,10)
			Set tFormatter = ##class(%JSON.Formatter).%New()
			Set tFormatter.IndentChars = tIndentChars
			Set tFormatter.LineTerminator = tLineTerminator
		}
		
		#dim tTransformObj As HS.FHIR.DTL.Util.API.Transform.SDA3ToFHIR
		
		Set tTransformObj = $ClassMethod(..TransformClass, "TransformStream", pSDAStream, "HS.SDA3.Container", tFHIRMetadataSetKey, pPatientResourceId)
		
		// tTransformObj.bundle is a %DynamicObject.
		Set tBundleObj = tTransformObj.bundle

		$$$HSTRACE("Bundle object", "tBundleObj", tBundleObj.%ToJSON())


		Set tBundleObj = ..UpdateBundle(tBundleObj)

		
		$$$HSTRACE("Bundle object", "tBundleObj", tBundleObj.%ToJSON())
		
		// "individual" is not a transaction type or interaction.
		// This mode causes each entry in the Bundle to be sent
		// to TargetConfigName individually, not as a transaction.
		If ..TransmissionMode="individual" {
			For i = 0:1:tBundleObj.entry.%Size()-1 {
				If tIsInteropHost {
					Set tSC = ..CreateAndSendInteropMessage(tBundleObj.entry.%Get(i), tSchema, tMessageContentType, tFormatter, tIndentChars, tLineTerminator, pSessionApplication, pSessionId)
				} Else {
					Set tSC = ..CreateAndSendFHIRMessage(tBundleObj.entry.%Get(i), tSchema, tLocalHostAndPort, tMessageContentType, tFormatter, tIndentChars, tLineTerminator, pSessionApplication, pSessionId)
				}
			}
		} Else {
			If tIsInteropHost {
				Set tSC = ..CreateAndSendInteropMessage(tBundleObj, tSchema, tMessageContentType, tFormatter, tIndentChars, tLineTerminator, pSessionApplication, pSessionId)
			} Else {
				Set tSC = ..CreateAndSendFHIRMessage(tBundleObj, tSchema, tLocalHostAndPort, tMessageContentType, tFormatter, tIndentChars, tLineTerminator, pSessionApplication, pSessionId)
			}
		}

		set sc = ..syncOSCAR(tBundleObj)
				
	} Catch eException {
		Set tSC = eException.AsStatus()
	}
	
	Quit tSC
}

Method OnResponse(request As Ens.Request, ByRef response As Ens.Response, callrequest As Ens.StringContainer, callresponse As Ens.StringContainer, pCompletionKey As %String) As %Status
{
	Quit $$$OK
}

Storage Default
{
<Data name="ProcessDefaultData">
<Subscript>"Process"</Subscript>
<Value name="1">
<Value>TraceOperations</Value>
</Value>
<Value name="2">
<Value>TargetConfigName</Value>
</Value>
<Value name="3">
<Value>FHIRVersion</Value>
</Value>
<Value name="4">
<Value>TransmissionMode</Value>
</Value>
<Value name="5">
<Value>FullTransactionResponse</Value>
</Value>
<Value name="6">
<Value>FHIRFormat</Value>
</Value>
<Value name="7">
<Value>FormatFHIROutput</Value>
</Value>
<Value name="8">
<Value>CallbackClass</Value>
</Value>
<Value name="9">
<Value>ValidResourceRequired</Value>
</Value>
<Value name="10">
<Value>OutputToQuickStream</Value>
</Value>
<Value name="11">
<Value>TransformClass</Value>
</Value>
<Value name="12">
<Value>FHIRMetadataSet</Value>
</Value>
<Value name="13">
<Value>FHIREndpoint</Value>
</Value>
<Value name="14">
<Value>FHIRServer</Value>
</Value>
<Value name="15">
<Value>%CredentialsObj</Value>
</Value>
<Value name="16">
<Value>CredentialsObj</Value>
</Value>
<Value name="17">
<Value>Credentials</Value>
</Value>
<Value name="18">
<Value>FHIRServerCredentials</Value>
</Value>
<Value name="19">
<Value>syncTarget</Value>
</Value>
<Value name="20">
<Value>LookupTable</Value>
</Value>
</Data>
<DefaultData>ProcessDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
