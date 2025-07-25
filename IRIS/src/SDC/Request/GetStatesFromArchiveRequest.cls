Class SDC.Request.GetStatesFromArchiveRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.GetStatesFromArchiveResponse";

Property Extension As SDC.ns.ExtensionType;

Property DescriptorRevisions As SDC.msg.VersionFrame;

Property TimeFrame As SDC.msg.TimeFrame;

Property Handle As list Of SDC.ns1.HandleRef;

Storage Default
{
<Data name="GetStatesFromArchiveRequestDefaultData">
<Subscript>"GetStatesFromArchiveRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>DescriptorRevisions</Value>
</Value>
<Value name="3">
<Value>TimeFrame</Value>
</Value>
<Value name="4">
<Value>Handle</Value>
</Value>
</Data>
<DefaultData>GetStatesFromArchiveRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
