/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.LocalizedText Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = (SDC.ns1.LocalizedTextContent, SDC.ns1.LocalizedTextRef, SDC.ns1.LocalizedTextWidth, SDC.ns1.ReferencedVersion), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "LocalizedText";

Parameter XMLSEQUENCE = 1;

Property content As SDC.ns1.LocalizedTextContent(XMLNAME = "content", XMLPROJECTION = "CONTENT");

Property Ref As SDC.ns1.LocalizedTextRef(XMLNAME = "Ref", XMLPROJECTION = "ATTRIBUTE");

Property Lang As %String(MAXLEN = "", XMLNAME = "Lang", XMLPROJECTION = "ATTRIBUTE");

Property Version As SDC.ns1.ReferencedVersion(XMLNAME = "Version", XMLPROJECTION = "ATTRIBUTE");

Property TextWidth As SDC.ns1.LocalizedTextWidth(XMLNAME = "TextWidth", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="LocalizedTextState">
<Value name="1">
<Value>content</Value>
</Value>
<Value name="2">
<Value>Ref</Value>
</Value>
<Value name="3">
<Value>Lang</Value>
</Value>
<Value name="4">
<Value>Version</Value>
</Value>
<Value name="5">
<Value>TextWidth</Value>
</Value>
</Data>
<State>LocalizedTextState</State>
<StreamLocation>^SDC.ns1.LocalizedTextS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
