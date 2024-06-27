/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AlertConditionDescriptor Extends SDC.ns1.AbstractAlertDescriptor [ CompileAfter = (SDC.ns1.AlertConditionKind, SDC.ns1.AlertConditionPriority, SDC.ns1.HandleRef), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AlertConditionDescriptor";

Property Source As list Of SDC.ns1.HandleRef(XMLNAME = "Source", XMLPROJECTION = "ELEMENT");

Property CauseInfo As list Of SDC.ns1.CauseInfo(XMLNAME = "CauseInfo", XMLPROJECTION = "ELEMENT");

Property Kind As SDC.ns1.AlertConditionKind(XMLNAME = "Kind", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property Priority As SDC.ns1.AlertConditionPriority(XMLNAME = "Priority", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property DefaultConditionGenerationDelay As %String(MAXLEN = "", XMLNAME = "DefaultConditionGenerationDelay", XMLPROJECTION = "ATTRIBUTE");

Property CanEscalate As SDC.ns1.AlertConditionPriority(VALUELIST = ",Lo,Me,Hi", XMLNAME = "CanEscalate", XMLPROJECTION = "ATTRIBUTE");

Property CanDeescalate As SDC.ns1.AlertConditionPriority(VALUELIST = ",Me,Lo,None", XMLNAME = "CanDeescalate", XMLPROJECTION = "ATTRIBUTE");

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
</Data>
<Type>%Storage.Serial</Type>
}

}
