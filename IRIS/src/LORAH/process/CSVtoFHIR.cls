/// 
Class LORAH.process.CSVtoFHIR Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='LORAH.RM.Patient.Record' response='Ens.StringContainer' height='2000' width='2000' >
<context>
<property name='Patient' type='HS.FHIR.DTL.vR4.Model.Resource.Patient' instantiate='0' />
<property name='PatientXML' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='FHIRRequest' type='HS.FHIRServer.Interop.Request' instantiate='0' />
<property name='FHIRRequestXML' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1350' >
<transform name='Patient' class='LORAH.transform.Patient.CSVtoFHIRModel' source='request' target='context.Patient' xpos='200' ypos='250' />
<trace name='Patient' value='"Patient " _ context.Patient.name.GetAt(1).given.GetAt(1) _ " " _ context.Patient.name.GetAt(1).family _   " transformed"' xpos='200' ypos='350' />
<code name='Patient XML' xpos='200' ypos='450' >
<![CDATA[ kill xml
 do context.Patient.XMLExportToString(.xml)
 set context.PatientXML = xml]]>
</code>
<trace name='Patient XML' value='context.PatientXML' xpos='200' ypos='550' />
<code name='Patient JSON' xpos='200' ypos='650' >
<![CDATA[ set PatientJSON = context.Patient.ToJSON()
 ]]>
</code>
<trace name='Patient JSON' value='PatientJSON.Read()' xpos='200' ypos='750' />
<transform name='FHIR to FHIRServer' class='LORAH.DTL.BuildFHIRInteropRequest.FromObjectModelResource' source='context.Patient' target='context.FHIRRequest' xpos='200' ypos='850' />
<code name='Patient JSON' xpos='200' ypos='950' >
<![CDATA[ kill xml
 do context.FHIRRequest.XMLExportToString(.xml)
 set context.FHIRRequestXML = xml]]>
</code>
<trace name='FHIR Request' value='context.FHIRRequestXML' xpos='200' ypos='1050' />
<code xpos='200' ypos='1150' disabled="true">
<![CDATA[ Set tRequest=##Class(HS.Util.Trace.Request).%New()
 Set tRequest.CurrentClass="LORAH.process.CSVtoFHIR"
 Set tRequest.CurrentMethod="TRACE"
 New %HSBlobMode
 Set %HSBlobMode="HSTrace"
 Set tMaxStringLength = $$$MaxStringLength-2500
 Set tSC=$$$OK
 Set tStream = ##class(%GlobalCharacterStream).%New()
 Do tStream.Write("<![CDATA[")
 Set tSC = tStream.CopyFrom(context.FHIRRequest)
 Do tStream.Write("]]]]><![CDATA[>")
					Do tVal.Rewind()
				} Elseif tVal.%Extends("%DynamicAbstractObject") {
					Do tStream.Write("<![CDATA[")
					if $$$HSTraceIsFull {
						do ##class(%JSON.Formatter).%New().FormatToStream(tVal, .tStream)
					} else {
						do tVal.%ToJSON(.tStream)
					}
					Do tStream.Write("]]]]><![CDATA[>")
				}
				
				#; Populate .ItemValue or .ItemStream depending on exported XML length
				#; If XMLExport failed, the error text will be put into the item value
				Set tItem.ItemClass=tVal
				If $$$ISERR(tSC) {
					#; XML encode error text to be safe (i.e. a <STORE> error)
					Set tItem.ItemValue = $ZCVT($SYSTEM.Status.GetErrorText(tSC),"O","XML")
				}
				// Using StringLength property which is $$$MaxStringLength-2500 to give 2500 bytes of overhead for other properties
				ElseIf tStream.Size < tMaxStringLength {
					Do tStream.Rewind()
					Set tItem.ItemValue=tStream.Read(tMaxStringLength)
				} 
				Else {
					Set tItem.ItemStream=tStream
				}

			}
			Else {
				#; Native data value
				If tItem.ItemName="tSC" Set tVal=$S(tVal=1:1,1:$SYSTEM.Status.GetErrorText(tVal))
				Set tItem.ItemValue=$zcvt(tVal,"O","XML")
			}
			Do tRequest.Items.Insert(tItem)
			Set tMaxStringLength=tMaxStringLength-$l(tItem.ItemValue)
		}
	}
	return tRequest]]>
</code>
<call name='FHIR' target='HS.FHIRServer.Interop.Operation' async='1' xpos='200' ypos='1250' >
<request type='HS.FHIRServer.Interop.Request' >
<assign property="callrequest" value="context.FHIRRequest" action="set" languageOverride="" />
</request>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
