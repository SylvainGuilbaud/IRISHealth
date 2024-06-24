Class IRISHealth.transfo.SegmentHtoMSH Extends Ens.DataTransformDTL [ DependsOn = (HPRIM.EDI.E1238.Segment, EnsLib.HL7.Segment) ]
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
<assign value='source.{SenderNameOrId.SenderNameOrId}' property='target.{SendingFacility.NamespaceID}' action='set' />
<assign value='source.{ReceiverId}' property='target.{ReceivingApplication}' action='set' />
<assign value='source.{ReceiverId}' property='target.{ReceivingFacility}' action='set' />
<assign value='source.{DateAndTimeOfMessage}' property='target.{DateTimeOfMessage}' action='set' />
<assign value='source.{ProcessingId}' property='target.{ProcessingID}' action='set' />
<assign value='source.{VersionNumber}' property='target.{VersionID}' action='set' />
<assign value='source.{ReservedField}' property='target.{MessageType}' action='set' />
<assign value='source.{Numsil}' property='target.{SequenceNumber}' action='set' />
</transform>
}

}
