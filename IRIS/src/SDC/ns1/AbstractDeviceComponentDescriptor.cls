/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AbstractDeviceComponentDescriptor Extends SDC.ns1.AbstractDescriptor [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AbstractDeviceComponentDescriptor";

Property ProductionSpecification As list Of SDC.ns1.ProductionSpecification(XMLNAME = "ProductionSpecification", XMLPROJECTION = "ELEMENT");

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
<Value>ProductionSpecification</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
