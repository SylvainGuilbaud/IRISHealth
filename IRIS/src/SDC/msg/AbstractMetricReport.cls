/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.AbstractMetricReport Extends SDC.msg.AbstractReport [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter XMLNAME = "AbstractMetricReport";

Property ReportPart As list Of SDC.msg.ReportPart2(XMLNAME = "ReportPart", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="AbstractReportState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>MdibVersion</Value>
</Value>
<Value name="3">
<Value>SequenceId</Value>
</Value>
<Value name="4">
<Value>InstanceId</Value>
</Value>
<Value name="5">
<Value>ReportPart</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
