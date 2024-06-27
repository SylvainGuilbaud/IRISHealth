/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AbstractMetricValue Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.Timestamp, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "AbstractMetricValue";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property MetricQuality As SDC.ns1.MetricQuality(XMLNAME = "MetricQuality") [ Required ];

Property Annotation As list Of SDC.ns1.Annotation(XMLNAME = "Annotation", XMLPROJECTION = "ELEMENT");

Property StartTime As SDC.ns1.Timestamp(XMLNAME = "StartTime", XMLPROJECTION = "ATTRIBUTE");

Property StopTime As SDC.ns1.Timestamp(XMLNAME = "StopTime", XMLPROJECTION = "ATTRIBUTE");

Property DeterminationTime As SDC.ns1.Timestamp(XMLNAME = "DeterminationTime", XMLPROJECTION = "ATTRIBUTE");

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
</Data>
<State>AbstractMetricValueState</State>
<StreamLocation>^SDC.ns1.AbstractMetricValueS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
