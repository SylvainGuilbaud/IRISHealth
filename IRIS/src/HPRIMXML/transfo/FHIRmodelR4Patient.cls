Class HPRIMXML.transfo.FHIRmodelR4Patient Extends Ens.DataTransformDTL [ DependsOn = (HS.FHIRModel.R4.Patient, EnsLib.EDI.XML.Document) ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HS.FHIRModel.R4.Patient' targetClass='EnsLib.EDI.XML.Document' targetDocType='msgAcquittementsServeurActes2_4:evenementsServeurActes' create='new' language='objectscript' >
<assign value='source.lastname' property='target.{choice.evenementServeurActe.patient.personnePhysique.nomUsuel}' action='set' />
<assign value='source.firstname' property='target.{choice.evenementServeurActe.patient.personnePhysique.prenoms(1)}' action='set' />
</transform>
}

}
