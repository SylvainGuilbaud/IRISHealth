/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.SampleArrayValue Extends SDC.ns1.AbstractMetricValue [ CompileAfter = SDC.ns1.RealTimeValueType, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "SampleArrayValue";

Property ApplyAnnotation As list Of SDC.ns1.ApplyAnnotation(XMLNAME = "ApplyAnnotation", XMLPROJECTION = "ELEMENT");

Property Samples As SDC.ns1.RealTimeValueType(XMLNAME = "Samples", XMLPROJECTION = "ATTRIBUTE");

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
<Value>ApplyAnnotation</Value>
</Value>
<Value name="8">
<Value>Samples</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
