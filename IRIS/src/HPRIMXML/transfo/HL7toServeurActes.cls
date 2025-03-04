Class HPRIMXML.transfo.HL7toServeurActes Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, EnsLib.EDI.XML.Document) ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.EDI.XML.Document' sourceDocType='2.5.1:SIU_S12' targetDocType='msgEvenementsServeurActes2_4:evenementsServeurActes' create='new' language='objectscript' >
<assign value='source.{PIDgrp(1).PID:PatientName(1).FamilyName}' property='target.{choice.evenementServeurActe.patient.personnePhysique.nomNaissance}' action='set' />
<assign value='source.{MSH:DateTimeOfMessage}' property='target.{enteteMessage.dateHeureProduction}' action='set' />
<assign value='source.{MSH:SendingApplication.NamespaceID}' property='target.{enteteMessage.emetteur().code}' action='set' />
<assign value='source.{MSH:SendingApplication.UniversalID}' property='target.{enteteMessage.emetteur().libelle}' action='set' />
<assign value='source.{MSH:SendingApplication.UniversalIDType}' property='target.{enteteMessage.emetteur().dictionnaire}' action='set' />
<assign value='source.{MSH:ReceivingApplication.NamespaceID}' property='target.{enteteMessage.destinataire().code}' action='set' />
<assign value='source.{MSH:ReceivingApplication.UniversalID}' property='target.{enteteMessage.destinataire().libelle}' action='set' />
<assign value='source.{MSH:ReceivingApplication.UniversalIDType}' property='target.{enteteMessage.destinataire().dictionnaire}' action='set' />
<assign value='source.{MSH:MessageType}' property='target.{enteteMessage.identifiantMessage}' action='set' />
<assign value='source.{MSH:SendingFacility.NamespaceID}' property='target.{enteteMessage.emetteur().code}' action='set' />
<assign value='source.{MSH:SendingFacility.UniversalID}' property='target.{enteteMessage.emetteur().libelle}' action='set' />
<assign value='source.{MSH:SendingFacility.UniversalIDType}' property='target.{enteteMessage.emetteur().dictionnaire}' action='set' />
<assign value='source.{PIDgrp(1).PID:PatientName(1).GivenName}' property='target.{choice.evenementServeurActe.patient.personnePhysique.prenoms(1)}' action='set' />
</transform>
}

}
