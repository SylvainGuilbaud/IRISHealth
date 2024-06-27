/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.VersionFrame Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.ReferencedVersion, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "VersionFrame";

Parameter XMLSEQUENCE = 1;

Property Start As SDC.ns1.ReferencedVersion(XMLNAME = "Start", XMLPROJECTION = "ATTRIBUTE");

Property End As SDC.ns1.ReferencedVersion(XMLNAME = "End", XMLPROJECTION = "ATTRIBUTE") [ SqlFieldName = _End ];

Storage Default
{
<Data name="VersionFrameState">
<Value name="1">
<Value>Start</Value>
</Value>
<Value name="2">
<Value>End</Value>
</Value>
</Data>
<State>VersionFrameState</State>
<StreamLocation>^SDC.msg.VersionFrameS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
