/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AbstractMetricState Extends SDC.ns1.AbstractState [ CompileAfter = SDC.ns1.ComponentActivation, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AbstractMetricState";

Property BodySite As list Of SDC.ns1.CodedValue(XMLNAME = "BodySite", XMLPROJECTION = "ELEMENT");

Property PhysicalConnector As SDC.ns1.PhysicalConnectorInfo(XMLNAME = "PhysicalConnector");

Property ActivationState As SDC.ns1.ComponentActivation(XMLNAME = "ActivationState", XMLPROJECTION = "ATTRIBUTE");

Property ActiveDeterminationPeriod As %String(MAXLEN = "", XMLNAME = "ActiveDeterminationPeriod", XMLPROJECTION = "ATTRIBUTE");

Property LifeTimePeriod As %String(MAXLEN = "", XMLNAME = "LifeTimePeriod", XMLPROJECTION = "ATTRIBUTE");

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
<Value>BodySite</Value>
</Value>
<Value name="6">
<Value>PhysicalConnector</Value>
</Value>
<Value name="7">
<Value>ActivationState</Value>
</Value>
<Value name="8">
<Value>ActiveDeterminationPeriod</Value>
</Value>
<Value name="9">
<Value>LifeTimePeriod</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
