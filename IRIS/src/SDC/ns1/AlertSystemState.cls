/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AlertSystemState Extends SDC.ns1.AbstractAlertState [ CompileAfter = (SDC.ns1.AlertConditionReference, SDC.ns1.Timestamp), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AlertSystemState";

Property SystemSignalActivation As list Of SDC.ns1.SystemSignalActivation(XMLNAME = "SystemSignalActivation", XMLPROJECTION = "ELEMENT");

Property LastSelfCheck As SDC.ns1.Timestamp(XMLNAME = "LastSelfCheck", XMLPROJECTION = "ATTRIBUTE");

Property SelfCheckCount As %Integer(XMLNAME = "SelfCheckCount", XMLPROJECTION = "ATTRIBUTE");

Property PresentPhysiologicalAlarmConditions As SDC.ns1.AlertConditionReference(XMLNAME = "PresentPhysiologicalAlarmConditions", XMLPROJECTION = "ATTRIBUTE");

Property PresentTechnicalAlarmConditions As SDC.ns1.AlertConditionReference(XMLNAME = "PresentTechnicalAlarmConditions", XMLPROJECTION = "ATTRIBUTE");

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
<Value>SystemSignalActivation</Value>
</Value>
<Value name="7">
<Value>LastSelfCheck</Value>
</Value>
<Value name="8">
<Value>SelfCheckCount</Value>
</Value>
<Value name="9">
<Value>PresentPhysiologicalAlarmConditions</Value>
</Value>
<Value name="10">
<Value>PresentTechnicalAlarmConditions</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
