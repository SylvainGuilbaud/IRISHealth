/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.InvocationInfo Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = (SDC.msg.InvocationError, SDC.msg.InvocationState, SDC.msg.TransactionId), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter XMLNAME = "InvocationInfo";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property TransactionId As SDC.msg.TransactionId(XMLNAME = "TransactionId") [ Required ];

Property InvocationState As SDC.msg.InvocationState(XMLNAME = "InvocationState") [ Required ];

Property InvocationError As SDC.msg.InvocationError(XMLNAME = "InvocationError");

Property InvocationErrorMessage As list Of SDC.ns1.LocalizedText(XMLNAME = "InvocationErrorMessage", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="InvocationInfoState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>TransactionId</Value>
</Value>
<Value name="3">
<Value>InvocationState</Value>
</Value>
<Value name="4">
<Value>InvocationError</Value>
</Value>
<Value name="5">
<Value>InvocationErrorMessage</Value>
</Value>
</Data>
<State>InvocationInfoState</State>
<StreamLocation>^SDC.msg.InvocationInfoS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
