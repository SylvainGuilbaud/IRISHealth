/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.Translation Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.CodeIdentifier, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "Translation";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Code As SDC.ns1.CodeIdentifier(XMLNAME = "Code", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property CodingSystem As %xsd.anyURI(XMLNAME = "CodingSystem", XMLPROJECTION = "ATTRIBUTE");

Property CodingSystemVersion As %String(MAXLEN = "", XMLNAME = "CodingSystemVersion", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="TranslationState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Code</Value>
</Value>
<Value name="3">
<Value>CodingSystem</Value>
</Value>
<Value name="4">
<Value>CodingSystemVersion</Value>
</Value>
</Data>
<State>TranslationState</State>
<StreamLocation>^SDC.ns1.TranslationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
