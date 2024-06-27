/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.Relation Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.EntryRef, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "Relation";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Code As SDC.ns1.CodedValue(XMLNAME = "Code");

Property Identification As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "Identification");

Property Kind As %String(MAXLEN = "", VALUELIST = ",Rcm,PS,SST,ECE,DCE,Oth", XMLNAME = "Kind", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property Entries As SDC.ns1.EntryRef(XMLNAME = "Entries", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Storage Default
{
<Data name="RelationState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Code</Value>
</Value>
<Value name="3">
<Value>Identification</Value>
</Value>
<Value name="4">
<Value>Kind</Value>
</Value>
<Value name="5">
<Value>Entries</Value>
</Value>
</Data>
<State>RelationState</State>
<StreamLocation>^SDC.ns1.RelationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
