Class HPRIMXML.transfo.FHIRmodelR4 Extends Ens.DataTransformDTL [ DependsOn = (FHIR.data, EnsLib.EDI.XML.Document) ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='FHIR.data' targetClass='EnsLib.EDI.XML.Document' targetDocType='msgAcquittementsServeurActes2_4:evenementsServeurActes' create='new' language='objectscript' >
<assign value='source.lastname' property='target.{choice.evenementServeurActe.patient.personnePhysique.nomUsuel}' action='set' />
<assign value='source.firstname' property='target.{choice.evenementServeurActe.patient.personnePhysique.prenoms(1)}' action='set' />
</transform>
}

}
