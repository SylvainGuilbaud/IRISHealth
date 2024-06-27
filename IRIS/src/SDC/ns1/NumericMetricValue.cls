/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.NumericMetricValue Extends SDC.ns1.AbstractMetricValue [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "NumericMetricValue";

Property Value As %Numeric(XMLNAME = "Value", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="AbstractMetricValueState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>MetricQuality</Value>
</Value>
<Value name="3">
<Value>Annotation</Value>
</Value>
<Value name="4">
<Value>StartTime</Value>
</Value>
<Value name="5">
<Value>StopTime</Value>
</Value>
<Value name="6">
<Value>DeterminationTime</Value>
</Value>
<Value name="7">
<Value>Value</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
