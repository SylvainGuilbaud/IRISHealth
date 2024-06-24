Class IRISHealth.transfo.HPRIMOBXtoHL7v2OBX Extends Ens.DataTransformDTL [ DependsOn = (HPRIM.EDI.E1238.Segment, EnsLib.HL7.Segment) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HPRIM.EDI.E1238.Segment' targetClass='EnsLib.HL7.Segment' sourceDocType='HPRIM2.2Add:OBX' targetDocType='2.5.1:OBX' create='new' language='objectscript' >
<assign value='source.{SetIdObservationalSimple}' property='target.{SetIDOBX}' action='set' />
<assign value='source.{ValueType}' property='target.{ValueType}' action='set' />
<assign value='source.{ObservationIdentifier}' property='target.{ObservationIdentifier}' action='set' />
<assign value='source.{ObservationSubid}' property='target.{ObservationSubID}' action='set' />
<assign value='source.{ObservationValue}' property='target.{ObservationValue()}' action='set' />
<assign value='source.{Units}' property='target.{Units}' action='set' />
<assign value='source.{ReferencesRange}' property='target.{ReferencesRange}' action='set' />
<assign value='source.{AbnormalFlags}' property='target.{AbnormalFlags()}' action='set' />
<assign value='source.{Probability}' property='target.{Probability}' action='set' />
<assign value='source.{NatureOfAbnormalTest}' property='target.{NatureofAbnormalTest()}' action='set' />
<assign value='source.{ObservationResultStatus}' property='target.{ObservationResultStatus}' action='set' />
<assign value='source.{EffectiveDateLastObservationNormalValues}' property='target.{EffectiveDateofReferenceRang}' action='set' />
<assign value='source.{UserDefinedAccessChecks}' property='target.{UserDefinedAccessChecks}' action='set' />
<assign value='source.{DateTimeOfTheObservation}' property='target.{DateTimeoftheObservation}' action='set' />
<assign value='source.{ProducersId}' property='target.{ProducersReference}' action='set' />
<assign value='source.{ResponsibleObserver}' property='target.{ResponsibleObserver()}' action='set' />
</transform>
}

}
