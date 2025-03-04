Class LORAH.DTL.BuildFHIRInteropRequest.FromObjectModelResource Extends Ens.DataTransformDTL [ DependsOn = (HS.FHIR.DTL.vR4.Model.Resource.Patient, HS.FHIRServer.Interop.Request) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HS.FHIR.DTL.vR4.Model.Resource.Patient' targetClass='HS.FHIRServer.Interop.Request' create='new' language='objectscript' >
<assign value='$ZDATETIME($HOROLOG,3,1)' property='target.Request.TimestampUTC' action='set' />
<assign value='"/fhir/r4"' property='target.Request.SessionApplication' action='set' />
<assign value='"PUT"' property='target.Request.RequestMethod' action='set' />
<assign value='"/"_source.resourceType_"/"_source.id' property='target.Request.RequestPath' action='set' />
<assign value='0' property='target.Request.IsRecursive' action='set' />
<group>
<annotation>Build QuickStream from source resource object</annotation>
<assign value='##Class(HS.SDA3.QuickStream).%New()' property='tQuickStream' action='set' />
<assign value='source.ToJSON()' property='tResourceAsJSON' action='set' />
<assign value='tQuickStream.CopyFromAndSave(tResourceAsJSON)' property='tStatus' action='set' />
<assign value='tQuickStream.Id' property='target.QuickStreamId' action='set' />
</group>
<assign value='"JSON"' property='target.Request.RequestFormatCode' action='set' />
<assign value='"JSON"' property='target.Request.ResponseFormatCode' action='set' />
<assign value='"http://host.docker.internal:18880/lorah/fhir/r4"' property='target.Request.BaseURL' action='set' disabled='1' />
<trace value='"in transformation:"_tQuickStream.Read()' />
</transform>
}

}
