/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.ReportPart1 Extends SDC.msg.AbstractReportPart [ CompileAfter = SDC.ns1.HandleRef, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter XMLINCLUDEINGROUP = 0;

Parameter XMLNAME = "ReportPart";

Parameter XMLTYPE = "ReportPart";

Property InvocationInfo As SDC.msg.InvocationInfo(XMLNAME = "InvocationInfo") [ Required ];

Property InvocationSource As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "InvocationSource") [ Required ];

Property OperationHandleRef As SDC.ns1.HandleRef(XMLNAME = "OperationHandleRef", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property OperationTarget As SDC.ns1.HandleRef(XMLNAME = "OperationTarget", XMLPROJECTION = "ATTRIBUTE");

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
<Value>InvocationInfo</Value>
</Value>
<Value name="4">
<Value>InvocationSource</Value>
</Value>
<Value name="5">
<Value>OperationHandleRef</Value>
</Value>
<Value name="6">
<Value>OperationTarget</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
