/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.InstanceIdentifier Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "InstanceIdentifier";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Type As SDC.ns1.CodedValue(XMLNAME = "Type");

Property IdentifierName As list Of SDC.ns1.LocalizedText(XMLNAME = "IdentifierName", XMLPROJECTION = "ELEMENT");

Property Root As %xsd.anyURI(MINLEN = 1, XMLNAME = "Root", XMLPROJECTION = "ATTRIBUTE");

/// ERROR: Duplicate Property name in Schema. 
Property Extension1 As %String(MAXLEN = "", MINLEN = 1, XMLNAME = "Extension", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="InstanceIdentifierState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Type</Value>
</Value>
<Value name="3">
<Value>IdentifierName</Value>
</Value>
<Value name="4">
<Value>Root</Value>
</Value>
<Value name="5">
<Value>Extension1</Value>
</Value>
</Data>
<State>InstanceIdentifierState</State>
<StreamLocation>^SDC.ns1.InstanceIdentifierS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
