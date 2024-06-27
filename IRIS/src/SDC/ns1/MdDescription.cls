/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.MdDescription Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.VersionCounter, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "MdDescription";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Mds As list Of SDC.ns1.MdsDescriptor(XMLNAME = "Mds", XMLPROJECTION = "ELEMENT");

Property DescriptionVersion As SDC.ns1.VersionCounter(XMLNAME = "DescriptionVersion", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="MdDescriptionState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Mds</Value>
</Value>
<Value name="3">
<Value>DescriptionVersion</Value>
</Value>
</Data>
<State>MdDescriptionState</State>
<StreamLocation>^SDC.ns1.MdDescriptionS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
