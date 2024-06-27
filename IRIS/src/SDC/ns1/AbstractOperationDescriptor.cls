/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AbstractOperationDescriptor Extends SDC.ns1.AbstractDescriptor [ CompileAfter = SDC.ns1.HandleRef, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AbstractOperationDescriptor";

Property OperationTarget As SDC.ns1.HandleRef(XMLNAME = "OperationTarget", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property MaxTimeToFinish As %String(MAXLEN = "", XMLNAME = "MaxTimeToFinish", XMLPROJECTION = "ATTRIBUTE");

Property InvocationEffectiveTimeout As %String(MAXLEN = "", XMLNAME = "InvocationEffectiveTimeout", XMLPROJECTION = "ATTRIBUTE");

Property Retriggerable As %Boolean(XMLNAME = "Retriggerable", XMLPROJECTION = "ATTRIBUTE");

Property AccessLevel As %String(MAXLEN = "", VALUELIST = ",Usr,CSUsr,RO,SP,Oth", XMLNAME = "AccessLevel", XMLPROJECTION = "ATTRIBUTE");

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
</Data>
<Type>%Storage.Serial</Type>
}

}
