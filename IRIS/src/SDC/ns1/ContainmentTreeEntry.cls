/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.ContainmentTreeEntry Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.HandleRef, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "ContainmentTreeEntry";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Type As SDC.ns1.CodedValue(XMLNAME = "Type");

Property HandleRef As SDC.ns1.HandleRef(XMLNAME = "HandleRef", XMLPROJECTION = "ATTRIBUTE");

Property ParentHandleRef As SDC.ns1.HandleRef(XMLNAME = "ParentHandleRef", XMLPROJECTION = "ATTRIBUTE");

Property EntryType As %String(MAXLEN = "", XMLNAME = "EntryType", XMLPROJECTION = "ATTRIBUTE");

Property ChildrenCount As %xsd.int(XMLNAME = "ChildrenCount", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="ContainmentTreeEntryState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Type</Value>
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
<State>ContainmentTreeEntryState</State>
<StreamLocation>^SDC.ns1.ContainmentTreeEntryS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
