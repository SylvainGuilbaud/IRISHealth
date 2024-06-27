/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AlertConditionState Extends SDC.ns1.AbstractAlertState [ CompileAfter = (SDC.ns1.AlertConditionPriority, SDC.ns1.Timestamp), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AlertConditionState";

Property ActualConditionGenerationDelay As %String(MAXLEN = "", XMLNAME = "ActualConditionGenerationDelay", XMLPROJECTION = "ATTRIBUTE");

Property ActualPriority As SDC.ns1.AlertConditionPriority(XMLNAME = "ActualPriority", XMLPROJECTION = "ATTRIBUTE");

Property Rank As %xsd.int(XMLNAME = "Rank", XMLPROJECTION = "ATTRIBUTE");

Property Presence As %Boolean(XMLNAME = "Presence", XMLPROJECTION = "ATTRIBUTE");

Property DeterminationTime As SDC.ns1.Timestamp(XMLNAME = "DeterminationTime", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="AbstractStateState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>StateVersion</Value>
</Value>
<Value name="3">
<Value>DescriptorHandle</Value>
</Value>
<Value name="4">
<Value>DescriptorVersion</Value>
</Value>
<Value name="5">
<Value>ActivationState</Value>
</Value>
<Value name="6">
<Value>ActualConditionGenerationDelay</Value>
</Value>
<Value name="7">
<Value>ActualPriority</Value>
</Value>
<Value name="8">
<Value>Rank</Value>
</Value>
<Value name="9">
<Value>Presence</Value>
</Value>
<Value name="10">
<Value>DeterminationTime</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
