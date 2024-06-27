Class SDC.Response.DescriptionModificationReportResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Extension As SDC.ns.ExtensionType;

Property MdibVersion As SDC.ns1.VersionCounter;

Property SequenceId As %xsd.anyURI;

Property InstanceId As %xsd.unsignedLong;

Property ReportPart As list Of SDC.msg.ReportPart7;

Storage Default
{
<Data name="DescriptionModificationReportResponseDefaultData">
<Subscript>"DescriptionModificationReportResponse"</Subscript>
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
<DefaultData>DescriptionModificationReportResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
