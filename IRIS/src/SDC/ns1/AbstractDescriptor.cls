/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AbstractDescriptor Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = (SDC.ns1.Handle, SDC.ns1.SafetyClassification, SDC.ns1.VersionCounter), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "AbstractDescriptor";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Type As SDC.ns1.CodedValue(XMLNAME = "Type");

Property Handle As SDC.ns1.Handle(XMLNAME = "Handle", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property DescriptorVersion As SDC.ns1.VersionCounter(XMLNAME = "DescriptorVersion", XMLPROJECTION = "ATTRIBUTE");

Property SafetyClassification As SDC.ns1.SafetyClassification(XMLNAME = "SafetyClassification", XMLPROJECTION = "ATTRIBUTE");

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
</Data>
<State>AbstractDescriptorState</State>
<StreamLocation>^SDC.ns1.AbstractDescriptorS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
