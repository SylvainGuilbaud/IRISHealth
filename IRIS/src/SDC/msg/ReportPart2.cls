/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.ReportPart2 Extends SDC.msg.AbstractReportPart [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter XMLINCLUDEINGROUP = 0;

Parameter XMLNAME = "ReportPart";

Parameter XMLTYPE = "ReportPart";

Property MetricState As list Of SDC.ns1.AbstractMetricState(CLASSNAME = 1, XMLNAME = "MetricState", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="AbstractReportPartState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>SourceMds</Value>
</Value>
<Value name="3">
<Value>MetricState</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
