Class LORAH.transform.Patient.CSVtoFHIRModelResource Extends Ens.DataTransformDTL [ DependsOn = (LORAH.RM.Patient.Record, HS.FHIR.DTL.vR4.Model.Base.Resource) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='LORAH.RM.Patient.Record' targetClass='HS.FHIR.DTL.vR4.Model.Base.Resource' create='new' language='objectscript' >
<assign value='..%New()' property='patient' action='set' />
<assign value='"Patient"' property='patient.resourceType' action='set' />
<assign value='source.id' property='patient.id' action='set' />
<assign value='source.datedenaissance' property='patient.birthDate' action='set' />
<assign value='..Lookup("gender",source.sexe)' property='patient.gender' action='set' />
<assign value='source.nom' property='patient.name.(1).family' action='set' />
<assign value='source.prenom' property='patient.name.(1).given.(1)' action='set' />
</transform>
}

}
