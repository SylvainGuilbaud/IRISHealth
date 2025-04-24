Class HPRIMXML.transfo.FHIRRequest Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.EDI.XML.Document, FHIR.request) ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.EDI.XML.Document' targetClass='FHIR.request' sourceDocType='msgEvenementsServeurActes2_4:evenementsServeurActes' create='new' language='objectscript' >
<assign value='source.{choice.evenementServeurActe.patient.identifiant.numeroIdentifiantPatients(1).autorite.nom}' property='autorite' action='set' />
<assign value='source.{choice.evenementServeurActe.patient.identifiant.numeroIdentifiantPatients(1).identifiant}' property='identifiant' action='set' />
<assign value='"/Patient"' property='target.RequestPath' action='set' />
<assign value='"identifier="_autorite_"|"_identifiant' property='target.QueryString' action='set' />
</transform>
}

}
