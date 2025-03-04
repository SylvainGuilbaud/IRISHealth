Class LORAH.transform.Patient.CSVtoFHIRModel Extends Ens.DataTransformDTL [ DependsOn = (LORAH.RM.Patient.Record, HS.FHIR.DTL.vR4.Model.Resource.Patient) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='LORAH.RM.Patient.Record' targetClass='HS.FHIR.DTL.vR4.Model.Resource.Patient' create='new' language='objectscript' >
<assign value='source.id' property='target.id' action='set' />
<assign value='source.datedenaissance' property='target.birthDate' action='set' />
<assign value='source.sexe' property='target.gender' action='set' />
<assign value='source.nom' property='target.name.(1).family' action='set' />
<assign value='source.prenom' property='target.name.(1).given.(1)' action='set' />
</transform>
}

}
