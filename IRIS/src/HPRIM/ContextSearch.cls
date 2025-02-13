Include Ensemble

/// Ensemble-specific version of context search methods.
Class HPRIM.ContextSearch Extends %ZEN.Portal.ContextSearch [ System = 4 ]
{

/// Search method: MsgSource.<br/>
/// Execute a search for all Config Item names that are message sources.<br/>
ClassMethod MsgSource(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Kill pResults  Set tSC=$$$OK, N=0
	Try {
		&sql(DECLARE msgSource CURSOR FOR
		     SELECT %EXACT(SourceConfigName)
		     INTO :tSource
		     FROM Ens.MessageHeader
		     GROUP BY SourceConfigName
		)
		&sql(OPEN msgSource)
		Quit:SQLCODE
		&sql(FETCH msgSource)
		While (SQLCODE = 0) {
			If $L(tSource) {
				Set N=N+1, pResults(N)=tSource
			}
			&sql(FETCH msgSource)
		}
		&sql(CLOSE msgSource)
	} Catch {
		Set tSC = $$$SystemError
	}
	Quit tSC
}

/// Search method: MsgTarget.<br/>
/// Execute a search for all Config Item names that are message targets.<br/>
ClassMethod MsgTarget(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Kill pResults  Set tSC=$$$OK, N=0
	Try {
		&sql(DECLARE msgTarget CURSOR FOR
		     SELECT %EXACT(TargetConfigName)
		     INTO :tTarget
		     FROM Ens.MessageHeader
		     GROUP BY TargetConfigName
		)
		&sql(OPEN msgTarget)
		Quit:SQLCODE
		&sql(FETCH msgTarget)
		While (SQLCODE = 0) {
			If $L(tTarget) {
				Set N=N+1, pResults(N)=tTarget
			}
			&sql(FETCH msgTarget)
		}
		&sql(CLOSE msgTarget)
	} Catch {
		Set tSC = $$$SystemError
	}
	Quit tSC
}

/// Search method: EnterpriseMessageSource.<br/>
/// Execute a search for all message sources in the Message Bank.<br/>
ClassMethod EnterpriseMessageSource(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Kill pResults  Set tSC=$$$OK, N=0
	Try {
		&sql(DECLARE entMsgSource CURSOR FOR
		     SELECT %EXACT(SourceConfigName)
		     INTO :tSource
		     FROM Ens_Enterprise_MsgBank.MessageHeader
		     GROUP BY SourceConfigName
		)
		&sql(OPEN entMsgSource)
		Quit:SQLCODE
		&sql(FETCH entMsgSource)
		While (SQLCODE = 0) {
			If $L(tSource) {
				Set N=N+1, pResults(N)=tSource
			}
			&sql(FETCH entMsgSource)
		}
		&sql(CLOSE entMsgSource)
	} Catch {
		Set tSC = $$$SystemError
	}
	Quit tSC
}

/// Search method: EnterpriseMessageTarget.<br/>
/// Execute a search for all message targets in the Message Bank.<br/>
ClassMethod EnterpriseMessageTarget(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Kill pResults  Set tSC=$$$OK, N=0
	Try {
		&sql(DECLARE entMsgTarget CURSOR FOR
		     SELECT %EXACT(TargetConfigName)
		     INTO :tTarget
		     FROM Ens_Enterprise_MsgBank.MessageHeader
		     GROUP BY TargetConfigName
		)
		&sql(OPEN entMsgTarget)
		Quit:SQLCODE
		&sql(FETCH entMsgTarget)
		While (SQLCODE = 0) {
			If $L(tTarget) {
				Set N=N+1, pResults(N)=tTarget
			}
			&sql(FETCH entMsgTarget)
		}
		&sql(CLOSE entMsgTarget)
	} Catch {
		Set tSC = $$$SystemError
	}
	Quit tSC
}

ClassMethod ProductionItems(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set tProduction = $get(pParms("productionName"))
	Set tType = $select($get(pParms("targets")): -$$$eHostTypeService, $get(pParms("sources")): -$$$eHostTypeOperation, $get(pParms("services")): $$$eHostTypeService, 1: "")
	Set tRS = ##class(%ResultSet).%New("Ens.Config.Production:EnumerateConfigItems")
	Set tStatus = tRS.%Execute(tProduction, tType)
	If $$$ISERR(tStatus) Quit tStatus

	If tProduction = "" {
		Set tIndex = 0
		Try {
			Set tIndex = $i(^||%ISC.Ens.ProdItems)
			While tRS.%Next(.tStatus) {
				Set tConfigName = tRS.%Get("ConfigName")
				If tConfigName '= "" Set ^||%ISC.Ens.ProdItems(tIndex,tConfigName) = ""
			}
			If $$$ISERR(tStatus) Quit
			Set tConfigName = ""
			Set pResults = 0
			For {
				Set tConfigName = $order(^||%ISC.Ens.ProdItems(tIndex,tConfigName))
				Quit:(tConfigName = "")
				Set pResults = pResults + 1
				Set pResults(pResults) = tConfigName
			}
		}
		Catch ex {
			Set tStatus = $$$SystemError
		}
		If tIndex Kill ^||%ISC.Ens.ProdItems(tIndex)
	}
	Else {
		While tRS.%Next(.tStatus) {
			Set pResults($i(pResults)) = tRS.%Get("ConfigName")
		}
	}
	Quit tStatus
}

ClassMethod CharacterSets(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	
	// initialize with our own names
	Set pResults(1) = "Binary"
	Set pResults(2) = "Native"
	Set n = 2
	
	// get the locale information
	Set loc=##class(%SYS.NLS.Locale).%New()
	Set tabs=loc.XLTTables
	
	// get the character set external names
	Set x="" 
	For { 
		Set x=$O(^%SYS("NLS","Chs","Ext-Int",x))  
		Quit:x=""  
		if ..InLocale($G(^%SYS("NLS","Chs","Ext-Int",x)),tabs) {	
			Set n = n + 1
			Set pResults(n) = x 
		}
	}
	
	// get the character set internal names (table names)
	For i=1:1:$LL(tabs) {
		Set n = n + 1
		Set pResults(n) = "@"_$List(tabs,i)
	}
	
	Quit tStatus
}

ClassMethod InLocale(pName As %String, pTabs As %List) As %Boolean
{
	Set found=0
	For i=1:1:$LL(pTabs) {
		Quit:found=1
		If $List(pTabs,i)=pName { Set found=1 }
	}
	Quit found
}

ClassMethod ProductionCategories(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set tProduction = $get(pParms("productionName"))
	If tProduction '= "" {
		Set tRS = ##class(%ResultSet).%New("Ens.Config.Production:EnumerateCategories")
		Set tStatus = tRS.%Execute(tProduction)
		If $$$ISERR(tStatus) Quit tStatus

		While tRS.%Next(.tStatus) {
			Set pResults($i(pResults)) = tRS.%Get("Category")
		}
	}
	Quit tStatus
}

ClassMethod MonitorCategories(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""
	Set tRS = ##class(%ResultSet).%New("Ens.Enterprise.MonitorRole:EnumerateMonitorRoles")
	Set tStatus = tRS.%Execute()
	While tRS.%Next(.tStatus) {
		Set tCategories = tRS.%Get("CategoryList")
		If tCategories '= "" {
			For i=1:1:$LENGTH(tCategories,",") {
				Set tCategory = $PIECE(tCategories,",",i)
				If (tCategory '= "") {
					Set tCatArray(tCategory) = ""
				}
			}
		}
	}
	Set tCat = ""
	Set tCatList = ""
	For {
		Set tCat = $order(tCatArray(tCat))
		Quit:(tCat = "")
		Set pResults($I(pResults)) = tCat
	}
	Quit tStatus
}

/// Execute a search for a basic subset of Caché datatypes
ClassMethod BasicDatatypes(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults
	Kill %objlasterror

	Try {
		For type = "%Boolean","%Date","%Decimal","%Double","%Integer","%Numeric","%String","%Time","%TimeStamp" {
			Set pResults($increment(count)) = type
		}
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	Quit tStatus
}

/// Search method to list the properties for a SearchTable specified in
/// the "searchTable" parameter.
ClassMethod SearchTableProperties(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC = $$$OK
	Kill pResults
	Set tMask = $ZCVT(pSearchKey,"U")
	Set n = 0
	
	Try {
		Set tSearchTable = $get(pParms("searchTable"))
		If (tSearchTable '= "") && ##class(%Dictionary.CompiledClass).%ExistsId(tSearchTable) {
			If $classmethod(tSearchTable,"%Extends","Ens.VDoc.SearchTable") {
				Kill %objlasterror
				Set tRS = ##class(%ResultSet).%New("Ens.VDoc.SearchTableGenerator:EnumerateSearchProps")
				If '$IsObject(tRS) Set tSC = %objlasterror Quit
				Set tSC = tRS.Execute(tSearchTable)
				If $$$ISOK(tSC) {
					For {
						If 'tRS.Next(.tSC) Quit
						Set tName = tRS.Get("Name")
						If (tMask'="") && ($E(tName,1,$L(tMask))'=tMask) Continue
						Set n = n+1
						Set pResults(n) = tName
					}
				}
			}
			ElseIf $classmethod(tSearchTable,"%Extends","Ens.CustomSearchTable") {
				Set tSC = $classmethod(tSearchTable,"ListAllProperties",.tIndexedProps,.tProps)
				If $$$ISERR(tSC) Quit
				Set pTopResults = $listlength(tIndexedProps)
				For i=1:1:pTopResults {
					Set pTopResults(i) = $listget(tIndexedProps,i)
				}
				Set pResults = $listlength(tProps)
				For i=1:1:pResults {
					Set pResults(i) = $listget(tProps,i)
				}
			}
		}
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

ClassMethod getDisplayList(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC = $$$OK
	Kill pResults
	Set tMask = $ZCVT(pSearchKey,"U")
	Set N = 0
	Try {
		Set tHostId = $get(pParms("host"))  Quit:""=tHostId
		Set tProp = $get(pParms("prop"))  Quit:""=tProp
		&sql(SELECT Classname INTO :tClass from Ens_Config.Item WHERE Id = :tHostId)
		Quit:""=$G(tClass)||SQLCODE
		Set tDisplayList=$$$GetPropertyParameter(tClass,tProp,"DISPLAYLIST")
		Set:""=tDisplayList tValueList=$$$GetPropertyParameter(tClass,tProp,"VALUELIST")
		Quit:""=tDisplayList
		Set tSep=$E(tDisplayList)  Quit:""=tSep
		Set tCount=$L(tDisplayList,tSep)
		For i=1:1:tCount { Set tItem=$ZStrip($P(tDisplayList,tSep,i),"<>W")  Continue:""=tItem
			Set N = N+1
			Set pResults(N) = tItem
		}
	}
	Catch {
		Set tSC = $$$ERROR($$$CacheError,$ZE)
	}
	Quit tSC
}

/// Display all the properties of a given object, including deep objects.
/// The method accepts the following parameters: <ul>
/// <li>	shallow = 0|1 -- only retrieve properties reflected in the class description.
/// This invokes ..<method>Properties</method>(). The default is 0.</li>
/// <li>	class -- the name of the class to retrieve properties for.</li>
/// <li>	sqlFields = 0|1 -- only retrieve properties which have an SQL projection (i.e. are stored or SQLComputed).</li></ul>
ClassMethod MessageProperties(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC = $$$OK
	Kill pResults
	
	#Define hasSQLProjection(%class,%prop) ($$$comMemberKeyGet(%class,$$$cCLASSproperty,%prop,$$$cPROPstorable) || $$$comMemberKeyGet(%class,$$$cCLASSproperty,%prop,$$$cPROPsqlcomputed))
	
	Try {
		Set tClass = $get(pParms("class"))
		Set tClass= $$$NormalizeClassname(tClass)
		Set tSQLFields = +$get(pParms("sqlFields"))
		Set tShallow = +$get(pParms("shallow"))
		Set tMask = $ZCVT(pSearchKey,"U")
		Set n = 0
		
		If tShallow {
			Set tSC = ..Properties(.pCaption, .pTopResults, .pResults, .pParms, pSearchKey)
			If tSQLFields {
				Set tKey = ""
				For {
					Set tKey = $order(pTopResults(tKey),1,tProp)
					Quit:(tKey = "")
					If '$$$hasSQLProjection(tClass,tProp) {
						Kill pTopResults(tKey)
					}
				}
				If $data(pTopResults)<10 Kill pTopResults
				For {
					Set tKey = $order(pResults(tKey),1,tProp)
					Quit:(tKey = "")
					If '$$$hasSQLProjection(tClass,tProp) {
						Kill pResults(tKey)
					}
				}
				If $data(pResults)<10 Kill pResults
			}
			Quit
		}
		If tClass '= "" {
			Kill %objlasterror
			Set tRS = ##class(%ResultSet).%New("Ens.VDoc.Utils:EnumerateDocContents")
			If '$IsObject(tRS) Set tSC = %objlasterror Quit
			Set tSC = tRS.Execute(tClass,"source",,,0,1)
			If $$$ISERR(tSC) Quit
			
			While tRS.Next() {
				Set tName = tRS.Get("Property")
				If (tMask'="") && ($ZCVT($E(tName,1,$L(tMask)),"U")'=tMask) Continue
				If tSQLFields && '$$$hasSQLProjection(tClass,tName) Continue
				
				Set tResults(tName) = ""
			}
			Set tName = ""
			For {
				Set tName = $order(tResults(tName))
				Quit:(tName = "")
				Set n = n + 1
				Set pResults(n) = tName
			}
		}
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}
	
	Quit tSC
}

/// Search method to list Virtual Document classes based on the EnumerateVDocs query in 
/// <class>Ens.VDoc.Interface</class>. The search method accepts three parameters: <ul>
/// <li>	segmented = 0|1 -- if 1, display classes which extend EnsLib.EDI.Segmented. Default is 0.</li>
/// <li>	abstract = 0|1 -- if 1, display abstract classes. Default is 0.</li>
/// <li>	persistent = 0|1 -- if 1, require the class to be persistent. Default is 1.</li></ul>
ClassMethod VDocClasses(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults
	Set pCaption = $$$Text("Classes")
	
	Try {
		Set tSegmented = $get(pParms("segmented"), 0)
		Set tPersistent = $get(pParms("persistent"), 1)
		Set tAbstract = $get(pParms("abstract"), 0)
		Set tRS = ##class(%ResultSet).%New("Ens.VDoc.Interface:EnumerateVDocs")
		Set tStatus = tRS.Execute(tPersistent, tAbstract)
		If $$$ISERR(tStatus) Quit
		Set n = 0
		
		While tRS.Next() {
			Set tClass = tRS.Get("Name")
			If tSegmented && '$classmethod(tClass, "%Extends", "EnsLib.EDI.Segmented") {
				Continue
			}
			Set n = n + 1
			Set pResults(n) = tClass
		}
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	Quit tStatus
}

/// This is a simpler method than the similar-purposed Classes() method in %ZEN.Portal.ContextSearch.
/// This method provides more accurate results in simpler cases. 
/// It is useful when you just want to list all subclasses.
/// Let the value of the "class" parameter be the name of the superclass whose subclasses you want to list.
ClassMethod SubclassOf(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC = $$$OK
	Kill pResults
	Try {
		Set n = 0
		Set tClass = $G(pParms("class"))
		Set tAbstract = ''$G(pParms("abstract"))
		If tClass '= "" {
			Set tRS = ##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
			Set tSC = tRS.Execute(tClass)
			While (tRS.Next()) {
				Set cls = tRS.Data("Name")
	 			If ('tAbstract) && ($$$comClassKeyGet(cls,$$$cCLASSabstract)) Continue
				Set n = n+1
				Set pResults(n) = cls
			}
		}
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

/// Get a list of known Enterprise Clients
ClassMethod EnterpriseClients(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults
	Try {
		Set tRS = ##class(%SQL.Statement).%ExecDirect(,"SELECT ID FROM Ens_Enterprise.MonitorClient ORDER BY ID")
		Set tCount = 0
		While tRS.%Next() {
			Set tCount = tCount + 1
			Set pResults(tCount) = tRS.ID
		}
	}
	Catch {
		Set tStatus = $$$SystemError
	}
	Quit tStatus
}

/// Get a list of Business Partner profiles
ClassMethod BusinessPartners(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC=$$$OK  Kill pResults
	Try {
		Kill %objlasterror
		Set tRS = ##class(%ResultSet).%New("Ens.Config.BusinessPartner:List")
		If '$IsObject(tRS) Set tSC = %objlasterror Quit
		Set tSC = tRS.Execute()  Quit:$$$ISERR(tSC)
		Set n=0  While (tRS.Next(.tSC)) { Set n = n+1
			Set pResults(n) = tRS.Get("PartnerName")
		}
	}
	Catch {
		Set tSC = $$$ERROR($$$CacheError,$ZE)
	}
	Quit tSC
}

/// Get a list of SSL/TLS Configurations
ClassMethod SSLConfigs(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC=$$$OK  Kill pResults
	Try {
		Set tConfigs = $$ListSSLConfigs^%SYS.SECURITY("Server")_","_$$ListSSLConfigs^%SYS.SECURITY("Client")
		// alphabetize and remove possible empty string before inserting into pResults
		For i=1:1:$L(tConfigs,",") {
			Set:$P(tConfigs,",",i)'="" tResults($P(tConfigs,",",i)) = ""
		}
		Set tName = ""
		For {
			Set tName = $O(tResults(tName)) Quit:tName=""
			Set pResults($i(n)) = tName
		}
	}
	Catch {
		Set tSC = $$$ERROR($$$CacheError,$ZE)
	}
	Quit tSC
}

/// Get a list of Credential definitions
ClassMethod Credentials(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC=$$$OK  Kill pResults
	Try {
		Kill %objlasterror
		Set tRS = ##class(%ResultSet).%New("Ens.Config.Credentials:List")
		If '$IsObject(tRS) Set tSC = %objlasterror Quit
		Set tSC = tRS.Execute()  Quit:$$$ISERR(tSC)
		Set n=0  While (tRS.Next(.tSC)) { Set n = n+1
			Set pResults(n) = tRS.Get("ID")
		}
	}
	Catch {
		Set tSC = $$$ERROR($$$CacheError,$ZE)
	}
	Quit tSC
}

/// Get a list of Record Map definitions
ClassMethod RecordMaps(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC=$$$OK  Kill pResults
	Try {
		Kill %objlasterror
		Set tRS = ##class(%ResultSet).%New("EnsLib.RecordMap.RecordMap:List")
		If '$IsObject(tRS) Set tSC = %objlasterror Quit
		Set tSC = tRS.Execute()  Quit:$$$ISERR(tSC)
		Set n=0  While (tRS.Next(.tSC)) { Set n = n+1
			Set pResults(n) = tRS.Get("name")
		}
	}
	Catch {
		Set tSC = $$$ERROR($$$CacheError,$ZE)
	}
	Quit tSC
}

ClassMethod RuleNames(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC=$$$OK  
	Kill pResults
	Try {
		Set tSC = ##class(Ens.Projection.Rule).GetRuleNameList(.list)  Quit:$$$ISERR(tSC)
		Set n=0, tName=""  For { Set tName=$O(list(tName)) Quit:tName=""  
			Set n = n+1
			Set pResults(n) = tName
		}
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

ClassMethod RoutingRuleNames(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC=$$$OK  
	Kill pResults
	Try {
		Set tSC = ##class(Ens.Projection.Rule).GetRuleNameList(.list)  Quit:$$$ISERR(tSC)
		Set n=0, tName=""  For { Set tName=$O(list(tName)) Quit:tName="" 
		
			// sort out whether the name is an alias or a class name and get the class name
			Set tValue = $G(list(tName))
			Set tClass = $S(tValue="":tName,1:tValue)
			
			// see if the class has a RuleAssistClass that indicates a routing rule
			Set tAssist = $$$GetClassParameter(tClass,"RuleAssistClass")
			If ((tAssist [ "EnsLib.HL7.MsgRouter") || (tAssist [ "EnsLib.MsgRouter")) {
				Set n = n+1
				Set pResults(n) = tName
			}
		}
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

/// Get a list of named schedule strings
ClassMethod ScheduleNames(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC=$$$OK  Kill pResults
	Try {
		Set tRS = ##class(%ResultSet).%New()
		Set tSC = tRS.Prepare("SELECT Name FROM Ens_Util.Schedule")  Quit:$$$ISERR(tSC)
		Set tSC = tRS.Execute()  Quit:$$$ISERR(tSC)
		Set n=0  While (tRS.Next(.tSC)) { Set n = n+1
			Set pResults(n) = "@"_tRS.Data("Name")
		} 
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

ClassMethod SearchTableClasses(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC=$$$OK  
	Kill pResults
	Try {
		Set n = 0
		Set tHostClass = $get(pParms("host"))  Quit:""=tHostClass
		Set tRS = ##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
		Do tRS.Execute("Ens.SearchTableBase")
		While (tRS.Next()) { 
			Set tSearchClass = tRS.Data("Name")
			If ($$$defClassKeyGet(tSearchClass,$$$cCLASSabstract)) Continue
			If ((tHostClass = "EnsLib.MsgRouter.RoutingEngine") || (##class(EnsPortal.Utils).IsSubclass(tHostClass,"EnsLib.MsgRouter.RoutingEngine"))) {
				Set n = n + 1
				Set pResults(n) = tSearchClass
			}
			Else { // get the DOCCLASS value for this search table class; see if it the same or a subclass of the document class for this host 
				Set tDocClass = $$$GetClassParameter(tSearchClass, "DOCCLASS")
				If (tHostClass [ "EnsLib.EDI.") { // document class EnsLib.EDI.*.Document
					Set tMatch = ((tDocClass = $P(tHostClass,".",1,3)_".Document") || (##class(EnsPortal.Utils).IsSubclass(tDocClass, $P(tHostClass,".",1,3)_".Document")))
				}
				ElseIf (tHostClass [ "EnsLib.HL7.") { // document class EnsLib.HL7.Message
					Set tMatch = ((tDocClass = "EnsLib.HL7.Message") || (##class(EnsPortal.Utils).IsSubclass(tDocClass, "EnsLib.HL7.Message")))
				}
				ElseIf (tHostClass [ "EnsLib.XML.") { // document class Ens.StreamContainer
					Set tMatch = ((tDocClass = "Ens.StreamContainer") || (##class(EnsPortal.Utils).IsSubclass(tDocClass, "Ens.StreamContainer")))
				}
				Else { // by default include all search table classes
					Set tMatch = 1
				}
				If (tMatch) {
					Set n = n + 1
					Set pResults(n) = tSearchClass
				}
			}
		}
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

ClassMethod SchemaCategories(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC=$$$OK  
	Kill pResults
	Try {
		Set n = 0
		Set tHostClass = $get(pParms("host"))  Quit:""=tHostClass
		If (tHostClass [ "HPRIM.EDI.") {
			Set tRS = ##class(%ResultSet).%New($P(tHostClass,".",1,3)_".Document:EnumerateTypeCategories")
		}
		Else {
			Quit
		}
		Do tRS.Execute()
		While (tRS.Next()) { 
			Set n = n + 1
			Set pResults(n) = tRS.Data("Category")
		}
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

ClassMethod BusinessServices(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set tRS = ##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	Set tStatus = tRS.%Execute("Ens.BusinessService")
	If $$$ISERR(tStatus) Quit tStatus

	While tRS.%Next(.tStatus) {
		Set tName = tRS.%Get("Name")
		If '##class(%Dictionary.CompiledClass).%ExistsId(tName) Continue
		If ($$$defClassKeyGet(tName,$$$cCLASSabstract)) Continue
		Set pResults($i(pResults)) = tName
	}
	Quit tStatus
}

ClassMethod BusinessMetrics(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set tRS = ##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	Set tStatus = tRS.%Execute("Ens.BusinessMetric")
	If $$$ISERR(tStatus) Quit tStatus

	While tRS.%Next(.tStatus) {
		Set tName = tRS.%Get("Name")
		If '##class(%Dictionary.CompiledClass).%ExistsId(tName) Continue
		If ($$$defClassKeyGet(tName,$$$cCLASSabstract)) Continue
		Set pResults($i(pResults)) = tName
	}
	Quit tStatus
}

ClassMethod BusinessProcesses(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set tRS = ##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	Set tStatus = tRS.%Execute("Ens.BusinessProcess")
	If $$$ISERR(tStatus) Quit tStatus

	While tRS.%Next(.tStatus) {
		Set tName = tRS.%Get("Name")
		If '##class(%Dictionary.CompiledClass).%ExistsId(tName) Continue
		If ($$$defClassKeyGet(tName,$$$cCLASSabstract)) Continue
		Set pResults($i(pResults)) = tName
	}
	Quit tStatus
}

ClassMethod BusinessComponents(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set tRS = ##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	Set tStatus = tRS.%Execute("Ens.BusinessProcess")
	If $$$ISERR(tStatus) Quit tStatus
	
	While tRS.%Next(.tStatus) {
		Set tName = tRS.Data("Name")  
		If '##class(%Dictionary.CompiledClass).%ExistsId(tName) Continue
		Set cdef = ##class(%Dictionary.ClassDefinition).%OpenId(tName)
		If ($IsObject(cdef) && (cdef.Abstract '= 1) && ..IsComponent(tName)) { // It's a valid non-abstract component classs
			Set pResults($i(pResults)) = tName
		}
	}
	Quit tStatus
}

/// Given a business process class name, return if it is a component
ClassMethod IsComponent(pClass As %String) As %Boolean
{
	Set tRet = 0
	Set $ZT = "Trap"
	Do {
		Set tRet = $zobjclassmethod(pClass,"IsComponent")
	} While(0)

Exit
	Quit tRet
Trap
	#; the error is most likely that this host does not
	#; support the IsComponent API.
 	Set $ZT=""
	Set tRet = 0
	Goto Exit
}

ClassMethod BusinessOperations(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set tRS = ##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	Set tStatus = tRS.%Execute("Ens.BusinessOperation")
	If $$$ISERR(tStatus) Quit tStatus

	While tRS.%Next(.tStatus) {
		Set tName = tRS.%Get("Name")
		If '##class(%Dictionary.CompiledClass).%ExistsId(tName) Continue
		If ($$$defClassKeyGet(tName,$$$cCLASSabstract)) Continue
		Set pResults($i(pResults)) = tName
	}
	Quit tStatus
}

ClassMethod WorkflowOperations(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set tRS = ##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	Set tStatus = tRS.%Execute("EnsLib.Workflow.Operation")
	If $$$ISERR(tStatus) Quit tStatus

	While tRS.%Next(.tStatus) {
		Set tName = tRS.%Get("Name")
		If '##class(%Dictionary.CompiledClass).%ExistsId(tName) Continue
		If ($$$defClassKeyGet(tName,$$$cCLASSabstract)) Continue
		Set pResults($i(pResults)) = tName
	}
	
	// Also include the superclass
	Set pResults($i(pResults)) = "EnsLib.Workflow.Operation"
	
	Quit tStatus
}

ClassMethod AllBusinessHosts(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set tRS = ##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	Set tStatus1 = tRS.%Execute("Ens.BusinessService")
	If $$$ISOK(tStatus1) {
		While tRS.%Next(.tStatus1) {
			Set tName = tRS.%Get("Name")
			If '##class(%Dictionary.CompiledClass).%ExistsId(tName) Continue
			If ($$$defClassKeyGet(tName,$$$cCLASSabstract)) Continue
			Set pResults($i(pResults)) = tName
		}
	}
	Kill tRS

	Set tRS = ##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	Set tStatus2 = tRS.%Execute("Ens.BusinessProcess")
	If $$$ISOK(tStatus2) {
		While tRS.%Next(.tStatus2) {
			Set tName = tRS.%Get("Name")
			If '##class(%Dictionary.CompiledClass).%ExistsId(tName) Continue
			If ($$$defClassKeyGet(tName,$$$cCLASSabstract)) Continue
			Set pResults($i(pResults)) = tName
		}
	}
	Kill tRS

	Set tRS = ##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	Set tStatus3 = tRS.%Execute("Ens.BusinessOperation")
	If $$$ISOK(tStatus3)
	While tRS.%Next(.tStatus3) {
		Set tName = tRS.%Get("Name")
		If '##class(%Dictionary.CompiledClass).%ExistsId(tName) Continue
		If ($$$defClassKeyGet(tName,$$$cCLASSabstract)) Continue
		Set pResults($i(pResults)) = tName
	}
	Kill tRS

	For s = tStatus1,tStatus2,tStatus3 {
		If $$$ISERR(s) Set tStatus = $system.Status.AppendStatus(tStatus,s)
	}
	Quit tStatus
}

ClassMethod ListEnsembleUsers(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set tRS = ##class(%ResultSet).%New("%SQL.Manager.CatalogPriv:Users")
	Set tStatus = tRS.%Execute()
	If $$$ISERR(tStatus) Quit tStatus

	While tRS.%Next(.tStatus) {
		Set tName = tRS.%Get("USERNAME")
		If ((tName = "_Ensemble") || (tName = "_PUBLIC") || (tName = "_SYSTEM") || (tName = "CSPSystem") || (tName = "UnknownUser")) {
			Continue
		}
		Set pResults($i(pResults)) = tName
	}
	Quit tStatus
}

/// List the names of all class packages in the hierarchy.
/// Exclude the InterSystems internal packages csp, CSPX, Ens, EnsLib, EnsPortal, HS, and any packages whose name starts with "%".
ClassMethod ClassPackages(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tSC = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set depth=1, pkg(0)=""
	Set tRS(depth) = ##class(%ResultSet).%New("%Dictionary.PackageDefinition:SubPackage")
	Set tSC = tRS(depth).%Execute(pkg(depth-1))
	While depth {
		If 'tRS(depth).%Next(.tSC) || $$$ISERR(tSC) {
			Kill tRS(depth)
			Set depth=depth-1
			Continue
		}
		Set tName = tRS(depth).%Get("Name")  
		Continue:$Case(tName,"":1,"csp":1,"CSPX":1,"Ens":1,"EnsLib":1,"EnsPortal":1,"HS":1,:$S("%"=$E(tName):1,1:0))
		Set tPrev=pkg(depth-1)
		Set pkg(depth) = $S(tPrev="":tName,1:tPrev_"."_tName)
		Set pResults($I(pResults)) = pkg(depth)
		Set depth=depth+1
		Set tRS(depth) = ##class(%ResultSet).%New("%Dictionary.PackageDefinition:SubPackage")
		Set tSC = tRS(depth).%Execute(pkg(depth-1))
	}
	Quit tSC
}

/// Get a list of link-local interface addresses
ClassMethod TCPLocalInterfaces(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Quit ##class(%IO.SocketCommon).GetLocalInterfaces(.pResults)
}

ClassMethod ManagedAlertSources(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Set tStatement = ##class(%SQL.Statement).%New()
	Set tStatus = tStatement.%Prepare("SELECT DISTINCT SourceConfigName FROM Ens_Alerting.ManagedAlert ORDER BY SourceConfigName")
	If $$$ISERR(tStatus) Quit tStatus
	Set tExactStatement = ##class(%SQL.Statement).%New()
	Set tStatus = tExactStatement.%Prepare("SELECT TOP 1 %EXACT(SourceConfigName) As ExactSource FROM Ens_Alerting.ManagedAlert WHERE SourceConfigName = ?")
	If $$$ISERR(tStatus) Quit tStatus
	Set tSourceRS = tStatement.%Execute()
	Set tCount = 0
	While tSourceRS.%Next() {
		Set tExactRS = tExactStatement.%Execute(tSourceRS.SourceConfigName)
		If tExactRS.%Next() {
			Set tCount = tCount + 1
			Set pResults(tCount) = tExactRS.ExactSource
		}
	}
	Quit $$$OK
}

ClassMethod ManagedAlertGroups(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""
	
	Set tCount = 0
	Set tGroup = ""
	For {
		Set tGroup = $order(^Ens.Alerting.ManagedAlertI("AlertGroups",tGroup))
		Quit:(tGroup = "")

		Set tCount = tCount + 1
		Set pResults(tCount) = tGroup
	}
	Quit $$$OK
}

/// Search method to get Productions for the System Default Settings page.
ClassMethod SDSGetProductions(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
 	Set tSC = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Try {
		Set tCount = 1
		Set pResults(1) = "*"
		Set gbl = $Name(@##class(EnsPortal.DefaultSetting).GetTempGlobal()@("work","productions"))
		Set tProd = ""
		For  {
		 	Set tProd = $O(@gbl@(tProd))
		 	Quit:tProd=""
			Set tCount = tCount + 1
			Set pResults(tCount) = tProd
		}
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}

	Quit tSC
}

/// Search method to get all items of a single Production or of all Productions for the System Default Settings page.
ClassMethod SDSGetProductionItems(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
 	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Try {
		Set tCount = 1
		Set pResults(1) = "*"
		Set gbl = $Name(@##class(EnsPortal.DefaultSetting).GetTempGlobal()@("work","items"))
		Set tItem = ""
		For  {
		 	Set tItem = $O(@gbl@(tItem))
		 	Quit:tItem=""
			Set tCount = tCount + 1
			Set pResults(tCount) = tItem
		}
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}

	Quit $$$OK
}

/// Search method to get all host class names for the System Default Settings page.
ClassMethod SDSGetHostClasses(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
 	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Try {
		Set tCount = 1
		Set pResults(1) = "*"
		Set gbl =$Name(@##class(EnsPortal.DefaultSetting).GetTempGlobal()@("work","classes"))
		Set tClass = ""
		For  {
		 	Set tClass = $O(@gbl@(tClass))
		 	Quit:tClass=""
			Set tCount = tCount + 1
			Set pResults(tCount) = tClass
		}
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}

	Quit $$$OK
}

/// Search method to get all setting names for the System Default Settings page.
ClassMethod SDSGetSettings(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
 	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""

	Try {
		Kill tOutList
		// Stuff in EnsColumns that is *NOT* a setting name
		For tName = "Age","Alerting","Basic","Count","Created","Detail","Dev","Duration","Error","False","ID","Info","IsActive","IsCompleted","IsError","Job","Label","LastAction","LastStartTime","LastStopTime","Legend","Level","Method","New","Options","Password","Production","Property","Queue","Reason","Roles","Session","SessionId","Status","TaskId","True","Units","Users" {
			Set tOutList(tName) = ""
		}
		// Item's core settings
		Try {
			Set tObj = ##class(Ens.Config.Item).%New("Ens.Config.Item")
			Kill tList
			Set tSC = tObj.GetStaticSettings(.tList)
		}
		Catch {
		}
		Set tIndex = ""
		For {
			Set tIndex = $O(tList(tIndex))
			Quit:tIndex=""
			Set tName = $Li(tList(tIndex),2)
			Set:tName'="" tOutList(tName) = ""
		}
		// Production's core settings
		Try {
			Set tObj = ##class(Ens.Config.Production).%New()
			Kill tList
			Set tSC = tObj.GetStaticSettings(.tList)
		}
		Catch {
		}
		Set tIndex = ""
		For {
			Set tIndex = $O(tList(tIndex))
			Quit:tIndex=""
			Set tName = $Li(tList(tIndex),2)
			Set:tName'="" tOutList(tName) = ""
		}

		// Get settings from domain EnsColumns less the exclusion list
		Set tLang = %session.Language
		Set tCount = 0
		Set tSett = "@"
		For  {
		 	Set tSett = $O(^CacheMsg("EnsColumns","en",tSett))
		 	Quit:tSett=""
		 	Continue:$D(tOutList(tSett))
		 	// Concatenate localized name if different
		 	Set tLoc = $G(^CacheMsg("EnsColumns",tLang,tSett))
		 	If (tLoc'="")&&(tLoc'=tSett) Set tFull = tSett_" ("_tLoc_")"
		 	Else  Set tFull = tSett
			Set tCount = tCount + 1
			Set pResults(tCount) = tFull
		}
	}
	Catch ex {
		Set tSC = ex.AsStatus()
	}

	Quit $$$OK
}

/// Context Search to get all the AlertGroups defined for config items in a specified production.
ClassMethod ProductionAlertGroups(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""
	Set tProduction = $get(pParms("productionName"))

	If (tProduction '= "") {
		Set tCount = 0
		Set tGroup = ""
		For {
			Set tGroup = $order(^Ens.Config.ItemI("AlertGroup",tProduction,tGroup))
			Quit:(tGroup = "")

			Set tCount = tCount + 1
			Set pResults(tCount) = tGroup
		}
	}
	Quit $$$OK
}

ClassMethod MessageBankNodes(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""
	Try {
		Set tRS = ##class(%SQL.Statement).%ExecDirect(,"SELECT ID,Name FROM Ens_Enterprise_MsgBank.Node ORDER BY ID DESC")
		Set tCount = 0
		While tRS.%Next() {
			Set tCount = tCount + 1
			Set pResults(tCount) = "+"_tRS.ID_":"_tRS.Name
		}
		Set tRS = ##class(%SQL.Statement).%ExecDirect(,"SELECT ID,Name FROM Ens_Enterprise_MsgBank.Node ORDER BY TimeUpdated DESC")
		If tRS.%Next() {Set pTopResults(1) = "+"_tRS.ID_":"_tRS.Name}
	}
	Catch {
		Set tStatus = $$$SystemError
	}
	
	Quit tStatus
}

/// Context Search to get all the Ensemble namespaces
ClassMethod GetEnsembleNamespaces(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
	Set tStatus = $$$OK
	Kill pResults, pTopResults
	Set pCaption = ""
	Set tCount = 0, tNS = ""
	For {
		Set tNS = $O(^%SYS("Ensemble","InstalledNamespace",tNS))
		Quit:(tNS = "")
		Set tCount = tCount + 1
		Set pResults(tCount) = tNS
	}
	Quit $$$OK
}

}
