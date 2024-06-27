/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.AbstractSetResponse Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.VersionCounter, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "AbstractSetResponse";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property InvocationInfo As SDC.msg.InvocationInfo(XMLNAME = "InvocationInfo") [ Required ];

Property MdibVersion As SDC.ns1.VersionCounter(XMLNAME = "MdibVersion", XMLPROJECTION = "ATTRIBUTE");

Property SequenceId As %xsd.anyURI(XMLNAME = "SequenceId", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property InstanceId As %xsd.unsignedLong(XMLNAME = "InstanceId", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="AbstractSetResponseState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>InvocationInfo</Value>
</Value>
<Value name="3">
<Value>MdibVersion</Value>
</Value>
<Value name="4">
<Value>SequenceId</Value>
</Value>
<Value name="5">
<Value>InstanceId</Value>
</Value>
</Data>
<State>AbstractSetResponseState</State>
<StreamLocation>^SDC.msg.AbstractSetResponseS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
