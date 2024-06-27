/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.LimitAlertConditionState Extends SDC.ns1.AlertConditionState [ CompileAfter = (SDC.ns1.AlertActivation, SDC.ns1.AlertConditionMonitoredLimits), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "LimitAlertConditionState";

Property Limits As SDC.ns1.Range(XMLNAME = "Limits") [ Required ];

Property MonitoredAlertLimits As SDC.ns1.AlertConditionMonitoredLimits(XMLNAME = "MonitoredAlertLimits", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property AutoLimitActivationState As SDC.ns1.AlertActivation(XMLNAME = "AutoLimitActivationState", XMLPROJECTION = "ATTRIBUTE");

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
<Value name="11">
<Value>Limits</Value>
</Value>
<Value name="12">
<Value>MonitoredAlertLimits</Value>
</Value>
<Value name="13">
<Value>AutoLimitActivationState</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
