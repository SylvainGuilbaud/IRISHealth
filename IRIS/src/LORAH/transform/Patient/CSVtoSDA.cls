Class LORAH.transform.Patient.CSVtoSDA Extends Ens.DataTransformDTL [ DependsOn = (LORAH.RM.Patient.Record, HS.SDA3.Patient) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='LORAH.RM.Patient.Record' targetClass='HS.SDA3.Patient' create='new' language='objectscript' >
<assign value='source.nom' property='target.Name.FamilyName' action='set' />
<assign value='source.prenom' property='target.Name.GivenName' action='set' />
<assign value='source.sexe' property='target.Gender.OriginalText' action='set' />
<assign value='source.datedenaissance_"T00:00:00"' property='target.BirthTime' action='set' />
<assign value='source.sexe' property='target.Addresses.(1).FromTime' action='set' />
<assign value='source.datedenaissance' property='target.Addresses.(2).FromTime' action='set' />
</transform>
}

}
