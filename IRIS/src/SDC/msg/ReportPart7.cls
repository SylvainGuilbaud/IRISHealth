/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.ReportPart7 Extends SDC.msg.AbstractReportPart [ CompileAfter = (SDC.msg.DescriptionModificationType, SDC.ns1.HandleRef), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter XMLINCLUDEINGROUP = 0;

Parameter XMLNAME = "ReportPart";

Parameter XMLTYPE = "ReportPart";

Property Descriptor As list Of SDC.ns1.AbstractDescriptor(CLASSNAME = 1, XMLNAME = "Descriptor", XMLPROJECTION = "ELEMENT") [ SqlFieldName = _Descriptor ];

Property State As list Of SDC.ns1.AbstractState(CLASSNAME = 1, XMLNAME = "State", XMLPROJECTION = "ELEMENT");

Property ParentDescriptor As SDC.ns1.HandleRef(XMLNAME = "ParentDescriptor", XMLPROJECTION = "ATTRIBUTE");

Property ModificationType As SDC.msg.DescriptionModificationType(XMLNAME = "ModificationType", XMLPROJECTION = "ATTRIBUTE");

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
<Value>Descriptor</Value>
</Value>
<Value name="4">
<Value>State</Value>
</Value>
<Value name="5">
<Value>ParentDescriptor</Value>
</Value>
<Value name="6">
<Value>ModificationType</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
