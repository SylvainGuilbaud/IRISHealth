/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.RetrievabilityInfo Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.msg.RetrievabilityMethod, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "RetrievabilityInfo";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Method As SDC.msg.RetrievabilityMethod(XMLNAME = "Method", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property UpdatePeriod As %String(MAXLEN = "", XMLNAME = "UpdatePeriod", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="RetrievabilityInfoState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Method</Value>
</Value>
<Value name="3">
<Value>UpdatePeriod</Value>
</Value>
</Data>
<State>RetrievabilityInfoState</State>
<StreamLocation>^SDC.msg.RetrievabilityInfoS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
