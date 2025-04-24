Class HPRIMXML.transfo.CSVtoEvtServeurActes Extends Ens.DataTransformDTL [ DependsOn = (data.patient, EnsLib.EDI.XML.Document) ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='data.patient' targetClass='EnsLib.EDI.XML.Document' targetDocType='msgEvenementsServeurActes2_4:evenementsServeurActes' create='new' language='objectscript' >
<assign value='source.lastname' property='target.{choice.evenementServeurActe.patient.personnePhysique.nomNaissance}' action='set' />
<assign value='source.firstname' property='target.{choice.evenementServeurActe.patient.personnePhysique.prenoms(1)}' action='set' />
<assign value='source.sendingApp' property='target.{enteteMessage.emetteur(1)}' action='set' />
<assign value='source.receivingApp' property='target.{enteteMessage.destinataire(1)}' action='set' />
<assign value='source.eventDate' property='target.{enteteMessage.dateHeureProduction}' action='set' />
<assign value='"925287F4-20A4-11F0-B7B4-EA3B43076670"' property='target.{choice.evenementServeurActe.patient.identifiant.numeroIdentifiantSante.identifiant}' action='set' />
<assign value='"925287F4-20A4-11F0-B7B4-EA3B43076670"' property='target.{choice.evenementServeurActe.patient.identifiant.numeroIdentifiantPatients(1).identifiant}' action='set' />
<assign value='"http://hospital.smarthealthit.org"' property='target.{choice.evenementServeurActe.patient.identifiant.numeroIdentifiantPatients(1).autorite.nom}' action='set' />
<assign value='$zd($h-$random(10000),3)' property='target.{choice.evenementServeurActe.patient.personnePhysique.dateNaissance.date}' action='set' />
</transform>
}

}
