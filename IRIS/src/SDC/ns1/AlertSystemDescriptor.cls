/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AlertSystemDescriptor Extends SDC.ns1.AbstractAlertDescriptor [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AlertSystemDescriptor";

Property AlertCondition As list Of SDC.ns1.AlertConditionDescriptor(CLASSNAME = 1, XMLNAME = "AlertCondition", XMLPROJECTION = "ELEMENT");

Property AlertSignal As list Of SDC.ns1.AlertSignalDescriptor(XMLNAME = "AlertSignal", XMLPROJECTION = "ELEMENT");

Property MaxPhysiologicalParallelAlarms As %xsd.unsignedInt(XMLNAME = "MaxPhysiologicalParallelAlarms", XMLPROJECTION = "ATTRIBUTE");

Property MaxTechnicalParallelAlarms As %xsd.unsignedInt(XMLNAME = "MaxTechnicalParallelAlarms", XMLPROJECTION = "ATTRIBUTE");

Property SelfCheckPeriod As %String(MAXLEN = "", XMLNAME = "SelfCheckPeriod", XMLPROJECTION = "ATTRIBUTE");

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
<Value>AlertCondition</Value>
</Value>
<Value name="7">
<Value>AlertSignal</Value>
</Value>
<Value name="8">
<Value>MaxPhysiologicalParallelAlarms</Value>
</Value>
<Value name="9">
<Value>MaxTechnicalParallelAlarms</Value>
</Value>
<Value name="10">
<Value>SelfCheckPeriod</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
