/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AlertSignalState Extends SDC.ns1.AbstractAlertState [ CompileAfter = (SDC.ns1.AlertSignalPresence, SDC.ns1.AlertSignalPrimaryLocation), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AlertSignalState";

Property ActualSignalGenerationDelay As %String(MAXLEN = "", XMLNAME = "ActualSignalGenerationDelay", XMLPROJECTION = "ATTRIBUTE");

Property Presence As SDC.ns1.AlertSignalPresence(XMLNAME = "Presence", XMLPROJECTION = "ATTRIBUTE");

Property Location As SDC.ns1.AlertSignalPrimaryLocation(XMLNAME = "Location", XMLPROJECTION = "ATTRIBUTE");

Property Slot As %xsd.unsignedInt(XMLNAME = "Slot", XMLPROJECTION = "ATTRIBUTE");

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
<Value>ActualSignalGenerationDelay</Value>
</Value>
<Value name="7">
<Value>Presence</Value>
</Value>
<Value name="8">
<Value>Location</Value>
</Value>
<Value name="9">
<Value>Slot</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
