/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.Value Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = (SDC.ns1.HandleRef, SDC.ns1.VersionCounter), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "Value";

Parameter XMLSEQUENCE = 1;

Property Value As SDC.ns1.SampleArrayValue(XMLNAME = "Value");

Property Metric As SDC.ns1.HandleRef(XMLNAME = "Metric", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property StateVersion As SDC.ns1.VersionCounter(XMLNAME = "StateVersion", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="ValueState">
<Value name="1">
<Value>Value</Value>
</Value>
<Value name="2">
<Value>Metric</Value>
</Value>
<Value name="3">
<Value>StateVersion</Value>
</Value>
</Data>
<State>ValueState</State>
<StreamLocation>^SDC.msg.ValueS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
