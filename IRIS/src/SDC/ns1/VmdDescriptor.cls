/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.VmdDescriptor Extends SDC.ns1.AbstractComplexDeviceComponentDescriptor [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "VmdDescriptor";

Property ApprovedJurisdictions As list Of SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLITEMNAME = "ApprovedJurisdiction", XMLNAME = "ApprovedJurisdictions", XMLPROJECTION = "COLLECTION");

Property Channel As list Of SDC.ns1.ChannelDescriptor(XMLNAME = "Channel", XMLPROJECTION = "ELEMENT");

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
<Value name="7">
<Value>AlertSystem</Value>
</Value>
<Value name="8">
<Value>Sco</Value>
</Value>
<Value name="9">
<Value>ApprovedJurisdictions</Value>
</Value>
<Value name="10">
<Value>Channel</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
