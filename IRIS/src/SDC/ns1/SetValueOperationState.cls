/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.SetValueOperationState Extends SDC.ns1.AbstractOperationState [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "SetValueOperationState";

Property AllowedRange As list Of SDC.ns1.Range(XMLNAME = "AllowedRange", XMLPROJECTION = "ELEMENT");

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
<Value>OperatingMode</Value>
</Value>
<Value name="6">
<Value>AllowedRange</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
