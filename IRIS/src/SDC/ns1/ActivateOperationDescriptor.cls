/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.ActivateOperationDescriptor Extends SDC.ns1.AbstractSetStateOperationDescriptor [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "ActivateOperationDescriptor";

Property Argument As list Of SDC.ns1.Argument(XMLNAME = "Argument", XMLPROJECTION = "ELEMENT");

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
<Value>OperationTarget</Value>
</Value>
<Value name="7">
<Value>MaxTimeToFinish</Value>
</Value>
<Value name="8">
<Value>InvocationEffectiveTimeout</Value>
</Value>
<Value name="9">
<Value>Retriggerable</Value>
</Value>
<Value name="10">
<Value>AccessLevel</Value>
</Value>
<Value name="11">
<Value>ModifiableData</Value>
</Value>
<Value name="12">
<Value>Argument</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
