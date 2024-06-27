/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.CodedValue Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = (SDC.ns1.CodeIdentifier, SDC.ns1.SymbolicCodeName), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "CodedValue";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property CodingSystemName As list Of SDC.ns1.LocalizedText(XMLNAME = "CodingSystemName", XMLPROJECTION = "ELEMENT");

Property ConceptDescription As list Of SDC.ns1.LocalizedText(XMLNAME = "ConceptDescription", XMLPROJECTION = "ELEMENT");

Property Translation As list Of SDC.ns1.Translation(XMLNAME = "Translation", XMLPROJECTION = "ELEMENT");

Property Code As SDC.ns1.CodeIdentifier(XMLNAME = "Code", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property CodingSystem As %xsd.anyURI(XMLNAME = "CodingSystem", XMLPROJECTION = "ATTRIBUTE");

Property CodingSystemVersion As %String(MAXLEN = "", XMLNAME = "CodingSystemVersion", XMLPROJECTION = "ATTRIBUTE");

Property SymbolicCodeName As SDC.ns1.SymbolicCodeName(XMLNAME = "SymbolicCodeName", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="CodedValueState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>CodingSystemName</Value>
</Value>
<Value name="3">
<Value>ConceptDescription</Value>
</Value>
<Value name="4">
<Value>Translation</Value>
</Value>
<Value name="5">
<Value>Code</Value>
</Value>
<Value name="6">
<Value>CodingSystem</Value>
</Value>
<Value name="7">
<Value>CodingSystemVersion</Value>
</Value>
<Value name="8">
<Value>SymbolicCodeName</Value>
</Value>
</Data>
<State>CodedValueState</State>
<StreamLocation>^SDC.ns1.CodedValueS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
