/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.ReportPart Extends SDC.msg.AbstractReportPart [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter XMLINCLUDEINGROUP = 0;

Parameter XMLNAME = "ReportPart";

Property ContextState As list Of SDC.ns1.AbstractContextState(CLASSNAME = 1, XMLNAME = "ContextState", XMLPROJECTION = "ELEMENT");

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
<Value>ContextState</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
