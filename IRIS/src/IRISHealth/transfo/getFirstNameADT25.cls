Class IRISHealth.transfo.getFirstNameADT25 Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, HTTP.msg.genderRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='HTTP.msg.genderRequest' sourceDocType='2.5:ADT_A01' create='new' language='objectscript' >
<assign value='source.{PID:PatientName().GivenName}' property='target.firstName' action='set' />
</transform>
}

}
