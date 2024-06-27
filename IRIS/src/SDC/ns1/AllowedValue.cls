/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AllowedValue Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AllowedValue";

Parameter XMLSEQUENCE = 1;

Property Value As %String(MAXLEN = "", XMLNAME = "Value") [ Required ];

Property Type As SDC.ns1.CodedValue(XMLNAME = "Type");

Property Identification As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "Identification");

Property Characteristic As SDC.ns1.Measurement(XMLNAME = "Characteristic");

Storage Default
{
<Data name="AllowedValueState">
<Value name="1">
<Value>Value</Value>
</Value>
<Value name="2">
<Value>Type</Value>
</Value>
<Value name="3">
<Value>Identification</Value>
</Value>
<Value name="4">
<Value>Characteristic</Value>
</Value>
</Data>
<State>AllowedValueState</State>
<StreamLocation>^SDC.ns1.AllowedValueS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
