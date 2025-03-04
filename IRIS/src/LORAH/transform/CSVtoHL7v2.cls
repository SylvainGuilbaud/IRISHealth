Class LORAH.transform.CSVtoHL7v2 Extends Ens.DataTransformDTL [ DependsOn = (LORAH.RM.Patient.Record, EnsLib.HL7.Message) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='LORAH.RM.Patient.Record' targetClass='EnsLib.HL7.Message' targetDocType='2.5.1:ADT_A01' create='new' language='objectscript' >
<assign value='source.id' property='target.{PID:PatientID}' action='set' />
<assign value='source.nom' property='target.{PID:PatientName(1).FamilyName}' action='set' />
<assign value='source.prenom' property='target.{PID:PatientName(1).GivenName}' action='set' />
<assign value='source.datedenaissance' property='target.{PID:DateTimeofBirth}' action='set' />
<assign value='..Lookup("gender",source.sexe)' property='target.{PID:AdministrativeSex}' action='set' />
</transform>
}

}
