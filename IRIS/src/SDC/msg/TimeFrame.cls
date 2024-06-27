/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.TimeFrame Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.Timestamp, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "TimeFrame";

Parameter XMLSEQUENCE = 1;

Property Start As SDC.ns1.Timestamp(XMLNAME = "Start", XMLPROJECTION = "ATTRIBUTE");

Property End As SDC.ns1.Timestamp(XMLNAME = "End", XMLPROJECTION = "ATTRIBUTE") [ SqlFieldName = _End ];

Storage Default
{
<Data name="TimeFrameState">
<Value name="1">
<Value>Start</Value>
</Value>
<Value name="2">
<Value>End</Value>
</Value>
</Data>
<State>TimeFrameState</State>
<StreamLocation>^SDC.msg.TimeFrameS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
