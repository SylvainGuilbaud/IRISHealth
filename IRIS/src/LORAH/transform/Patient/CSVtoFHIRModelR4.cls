Class LORAH.transform.Patient.CSVtoFHIRModelR4 Extends Ens.DataTransformDTL [ DependsOn = (LORAH.RM.Patient.Record, HS.FHIRModel.R4.Patient) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='LORAH.RM.Patient.Record' targetClass='HS.FHIRModel.R4.Patient' create='new' language='objectscript' >
<assign value='"Patient"' property='target.resourceType' action='set' />
<assign value='source.id' property='target.fhirID' action='set' />
<assign value='source.sexe' property='target.gender' action='set' />
<assign value='source.datedenaissance' property='target.birthDate' action='set' />
</transform>
}

}
