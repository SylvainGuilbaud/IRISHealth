Class IRISHealth.transfo.HPRIMHtoHL7v2MSH Extends Ens.DataTransformDTL [ DependsOn = (HPRIM.EDI.E1238.Segment, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HPRIM.EDI.E1238.Segment' targetClass='EnsLib.HL7.Segment' sourceDocType='HPRIM2.2Add:H' targetDocType='2.5.1:MSH' create='new' language='objectscript' >
<assign value='source.{FieldSeparator}' property='target.{FieldSeparator}' action='set' />
<assign value='source.{MessageControlId}' property='target.{MessageControlID}' action='set' />
<assign value='source.{SenderNameOrId.SenderNameOrId}' property='target.{SendingApplication.NamespaceID}' action='set' />
<assign value='source.{SenderNameOrId.SystemType}' property='target.{SendingApplication.UniversalID}' action='set' />
<assign value='source.{SenderNameOrId.SoftwareVersion}' property='target.{SendingApplication.UniversalIDType}' action='set' />
<assign value='source.{SenderNameOrId.SystemType}' property='target.{SendingFacility.UniversalID}' action='set' />
<assign value='source.{SenderNameOrId.SoftwareVersion}' property='target.{SendingFacility.UniversalIDType}' action='set' />
<assign value='source.{SenderNameOrId.SenderNameOrId}' property='target.{SendingFacility.NamespaceID}' action='set' />
<assign value='source.{ReceiverId}' property='target.{ReceivingApplication}' action='set' />
<assign value='source.{ReceiverId}' property='target.{ReceivingFacility}' action='set' />
<assign value='source.{DateAndTimeOfMessage}' property='target.{DateTimeOfMessage}' action='set' />
<assign value='source.{ProcessingId}' property='target.{ProcessingID}' action='set' />
<assign value='source.{VersionNumber}' property='target.{VersionID}' action='set' />
<assign value='source.{ReservedField}' property='target.{MessageType.MessageCode}' action='set' />
<assign value='"R01"' property='target.{MessageType.TriggerEvent}' action='set' />
<assign value='"R01"' property='target.{MessageType.MessageStructure}' action='set' />
<assign value='source.{Numsil}' property='target.{SequenceNumber}' action='set' />
</transform>
}

}
