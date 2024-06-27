/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.LimitAlertConditionDescriptor Extends SDC.ns1.AlertConditionDescriptor [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "LimitAlertConditionDescriptor";

Property MaxLimits As SDC.ns1.Range(XMLNAME = "MaxLimits") [ Required ];

Property AutoLimitSupported As %Boolean(XMLNAME = "AutoLimitSupported", XMLPROJECTION = "ATTRIBUTE");

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
<Value>Source</Value>
</Value>
<Value name="7">
<Value>CauseInfo</Value>
</Value>
<Value name="8">
<Value>Kind</Value>
</Value>
<Value name="9">
<Value>Priority</Value>
</Value>
<Value name="10">
<Value>DefaultConditionGenerationDelay</Value>
</Value>
<Value name="11">
<Value>CanEscalate</Value>
</Value>
<Value name="12">
<Value>CanDeescalate</Value>
</Value>
<Value name="13">
<Value>MaxLimits</Value>
</Value>
<Value name="14">
<Value>AutoLimitSupported</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
