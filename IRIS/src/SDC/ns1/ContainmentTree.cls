/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.ContainmentTree Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.HandleRef, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "ContainmentTree";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Entry As list Of SDC.ns1.ContainmentTreeEntry(XMLNAME = "Entry", XMLPROJECTION = "ELEMENT");

Property HandleRef As SDC.ns1.HandleRef(XMLNAME = "HandleRef", XMLPROJECTION = "ATTRIBUTE");

Property ParentHandleRef As SDC.ns1.HandleRef(XMLNAME = "ParentHandleRef", XMLPROJECTION = "ATTRIBUTE");

Property EntryType As %String(MAXLEN = "", XMLNAME = "EntryType", XMLPROJECTION = "ATTRIBUTE");

Property ChildrenCount As %xsd.int(XMLNAME = "ChildrenCount", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="ContainmentTreeState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Entry</Value>
</Value>
<Value name="3">
<Value>HandleRef</Value>
</Value>
<Value name="4">
<Value>ParentHandleRef</Value>
</Value>
<Value name="5">
<Value>EntryType</Value>
</Value>
<Value name="6">
<Value>ChildrenCount</Value>
</Value>
</Data>
<State>ContainmentTreeState</State>
<StreamLocation>^SDC.ns1.ContainmentTreeS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
