/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.SetStringOperationState Extends SDC.ns1.AbstractOperationState [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "SetStringOperationState";

Property AllowedValues As list Of %String(MAXLEN = "", XMLITEMNAME = "Value", XMLNAME = "AllowedValues", XMLPROJECTION = "COLLECTION");

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
<Value>AllowedValues</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
