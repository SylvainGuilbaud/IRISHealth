Class LORAH.transform.Patient.FHIRModeltoFHIRServer Extends Ens.DataTransformDTL [ DependsOn = (HS.FHIR.DTL.vR4.Model.Resource.Patient, HS.FHIRServer.Interop.Request) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HS.FHIR.DTL.vR4.Model.Resource.Patient' targetClass='HS.FHIRServer.Interop.Request' create='new' language='objectscript' >
<assign value='"/"' property='target.Request.RequestPath' action='set' />
<assign value='"PUT"' property='target.Request.RequestMethod' action='set' />
<assign value='"XML"' property='target.Request.RequestFormatCode' action='set' />
<assign value='"XML"' property='target.Request.ResponseFormatCode' action='set' />
<code>
<![CDATA[ Set tResourceStream = ##class(%Stream.TmpCharacter).%New()
 Do source.XMLExportToStream(tResourceStream)		
 Set tQuickStream = ##class(HS.SDA3.QuickStream).%New()
 Set target.QuickStreamId = tQuickStream.%Id()
 Do tQuickStream.CopyFrom(tResourceStream)]]></code>
</transform>
}

}
