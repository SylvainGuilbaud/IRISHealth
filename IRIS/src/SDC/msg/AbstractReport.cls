/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.AbstractReport Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.VersionCounter, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "AbstractReport";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property MdibVersion As SDC.ns1.VersionCounter(XMLNAME = "MdibVersion", XMLPROJECTION = "ATTRIBUTE");

Property SequenceId As %xsd.anyURI(XMLNAME = "SequenceId", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property InstanceId As %xsd.unsignedLong(XMLNAME = "InstanceId", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="AbstractReportState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>MdibVersion</Value>
</Value>
<Value name="3">
<Value>SequenceId</Value>
</Value>
<Value name="4">
<Value>InstanceId</Value>
</Value>
</Data>
<State>AbstractReportState</State>
<StreamLocation>^SDC.msg.AbstractReportS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
