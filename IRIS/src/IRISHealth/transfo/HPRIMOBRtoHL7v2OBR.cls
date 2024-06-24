Class IRISHealth.transfo.HPRIMOBRtoHL7v2OBR Extends Ens.DataTransformDTL [ DependsOn = (HPRIM.EDI.E1238.Segment, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HPRIM.EDI.E1238.Segment' targetClass='EnsLib.HL7.Segment' sourceDocType='HPRIM2.2Add:OBR' targetDocType='2.5.1:OBR' create='new' language='objectscript' >
<assign value='source.{SequenceNumber}' property='target.{SetIDOBR}' action='set' />
<assign value='source.{Priority}' property='target.{PriorityOBR}' action='set' />
<assign value='source.{RequestedOrderedDateAndTime}' property='target.{RequestedDateTime}' action='set' />
<assign value='source.{SpecimenCollectionDateAndTime}' property='target.{ObservationDateTime}' action='set' />
<assign value='source.{CollectionEndTime}' property='target.{ObservationEndDateTime}' action='set' />
<assign value='source.{CollectorId}' property='target.{CollectorIdentifier()}' action='set' />
<assign value='source.{CollectionVolumeInMl}' property='target.{CollectionVolume}' action='set' />
<assign value='source.{DangerCode}' property='target.{DangerCode}' action='set' />
<assign value='source.{ActionCode}' property='target.{SpecimenActionCode}' action='set' />
<assign value='source.{RelevantClinicalInformation}' property='target.{RelevantClinicalInformation}' action='set' />
<assign value='source.{DateTimeSpecimenReceived}' property='target.{SpecimenReceivedDateTime}' action='set' />
<assign value='source.{SpecimenDescriptorTypeSource}' property='target.{SpecimenSource}' action='set' />
<assign value='source.{OrderingPhysician}' property='target.{OrderingProvider()}' action='set' />
<assign value='source.{PhysiciansTelephoneNumber}' property='target.{OrderCallbackPhoneNumber()}' action='set' />
<assign value='source.{UserFieldNo1}' property='target.{PlacerField1}' action='set' />
<assign value='source.{UserFieldNo2}' property='target.{PlacerField2}' action='set' />
<assign value='source.{LaboratoryFieldNo1}' property='target.{FillerField1}' action='set' />
<assign value='source.{LaboratoryFieldNo2}' property='target.{FillerField2}' action='set' />
<assign value='source.{DateTimeResultsReportedOrLastModified}' property='target.{ResultsRptStatusChngDateTime}' action='set' />
<assign value='source.{InstrumentChargeToComputerSystem}' property='target.{ChargetoPractice}' action='set' />
<assign value='source.{InstrumentSectionId}' property='target.{DiagnosticServSectID}' action='set' />
<assign value='source.{ReportTypes}' property='target.{ResultStatus}' action='set' />
<assign value='source.{SpecimenId}' property='target.{PlacerOrderNumber}' action='set' />
<assign value='source.{InstrumentSpecimenId}' property='target.{FillerOrderNumber}' action='set' />
<assign value='source.{UniversalTestId}' property='target.{UniversalServiceIdentifier}' action='set' />
</transform>
}

}
