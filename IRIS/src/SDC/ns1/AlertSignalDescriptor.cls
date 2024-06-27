/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AlertSignalDescriptor Extends SDC.ns1.AbstractAlertDescriptor [ CompileAfter = (SDC.ns1.AlertSignalManifestation, SDC.ns1.HandleRef), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AlertSignalDescriptor";

Property ConditionSignaled As SDC.ns1.HandleRef(XMLNAME = "ConditionSignaled", XMLPROJECTION = "ATTRIBUTE");

Property Manifestation As SDC.ns1.AlertSignalManifestation(XMLNAME = "Manifestation", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property Latching As %Boolean(XMLNAME = "Latching", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property DefaultSignalGenerationDelay As %String(MAXLEN = "", XMLNAME = "DefaultSignalGenerationDelay", XMLPROJECTION = "ATTRIBUTE");

Property MinSignalGenerationDelay As %String(MAXLEN = "", XMLNAME = "MinSignalGenerationDelay", XMLPROJECTION = "ATTRIBUTE");

Property MaxSignalGenerationDelay As %String(MAXLEN = "", XMLNAME = "MaxSignalGenerationDelay", XMLPROJECTION = "ATTRIBUTE");

Property SignalDelegationSupported As %Boolean(XMLNAME = "SignalDelegationSupported", XMLPROJECTION = "ATTRIBUTE");

Property AcknowledgementSupported As %Boolean(XMLNAME = "AcknowledgementSupported", XMLPROJECTION = "ATTRIBUTE");

Property AcknowledgeTimeout As %String(MAXLEN = "", XMLNAME = "AcknowledgeTimeout", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="AbstractDescriptorState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Type</Value>
</Value>
<Value name="3">
<Value>Handle</Value>
</Value>
<Value name="4">
<Value>DescriptorVersion</Value>
</Value>
<Value name="5">
<Value>SafetyClassification</Value>
</Value>
<Value name="6">
<Value>ConditionSignaled</Value>
</Value>
<Value name="7">
<Value>Manifestation</Value>
</Value>
<Value name="8">
<Value>Latching</Value>
</Value>
<Value name="9">
<Value>DefaultSignalGenerationDelay</Value>
</Value>
<Value name="10">
<Value>MinSignalGenerationDelay</Value>
</Value>
<Value name="11">
<Value>MaxSignalGenerationDelay</Value>
</Value>
<Value name="12">
<Value>SignalDelegationSupported</Value>
</Value>
<Value name="13">
<Value>AcknowledgementSupported</Value>
</Value>
<Value name="14">
<Value>AcknowledgeTimeout</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
