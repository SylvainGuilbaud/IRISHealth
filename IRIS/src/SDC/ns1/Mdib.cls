/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.Mdib Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.VersionCounter, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "Mdib";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property MdDescription As SDC.ns1.MdDescription(XMLNAME = "MdDescription");

Property MdState As SDC.ns1.MdState(XMLNAME = "MdState");

Property MdibVersion As SDC.ns1.VersionCounter(XMLNAME = "MdibVersion", XMLPROJECTION = "ATTRIBUTE");

Property SequenceId As %xsd.anyURI(XMLNAME = "SequenceId", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property InstanceId As %xsd.unsignedLong(XMLNAME = "InstanceId", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="MdibState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>MdDescription</Value>
</Value>
<Value name="3">
<Value>MdState</Value>
</Value>
<Value name="4">
<Value>MdibVersion</Value>
</Value>
<Value name="5">
<Value>SequenceId</Value>
</Value>
<Value name="6">
<Value>InstanceId</Value>
</Value>
</Data>
<State>MdibState</State>
<StreamLocation>^SDC.ns1.MdibS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
