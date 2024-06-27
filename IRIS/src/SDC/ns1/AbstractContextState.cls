/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AbstractContextState Extends SDC.ns1.AbstractMultiState [ CompileAfter = (SDC.ns1.ContextAssociation, SDC.ns1.ReferencedVersion, SDC.ns1.Timestamp), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AbstractContextState";

Property Validator As list Of SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "Validator", XMLPROJECTION = "ELEMENT");

Property Identification As list Of SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "Identification", XMLPROJECTION = "ELEMENT");

Property ContextAssociation As SDC.ns1.ContextAssociation(XMLNAME = "ContextAssociation", XMLPROJECTION = "ATTRIBUTE");

Property BindingMdibVersion As SDC.ns1.ReferencedVersion(XMLNAME = "BindingMdibVersion", XMLPROJECTION = "ATTRIBUTE");

Property UnbindingMdibVersion As SDC.ns1.ReferencedVersion(XMLNAME = "UnbindingMdibVersion", XMLPROJECTION = "ATTRIBUTE");

Property BindingStartTime As SDC.ns1.Timestamp(XMLNAME = "BindingStartTime", XMLPROJECTION = "ATTRIBUTE");

Property BindingEndTime As SDC.ns1.Timestamp(XMLNAME = "BindingEndTime", XMLPROJECTION = "ATTRIBUTE");

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
<Value>Category</Value>
</Value>
<Value name="6">
<Value>Handle</Value>
</Value>
<Value name="7">
<Value>Validator</Value>
</Value>
<Value name="8">
<Value>Identification</Value>
</Value>
<Value name="9">
<Value>ContextAssociation</Value>
</Value>
<Value name="10">
<Value>BindingMdibVersion</Value>
</Value>
<Value name="11">
<Value>UnbindingMdibVersion</Value>
</Value>
<Value name="12">
<Value>BindingStartTime</Value>
</Value>
<Value name="13">
<Value>BindingEndTime</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
