Class SDC.Response.GetDescriptorsFromArchiveResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Extension As SDC.ns.ExtensionType;

Property MdibVersion As SDC.ns1.VersionCounter;

Property SequenceId As %xsd.anyURI;

Property InstanceId As %xsd.unsignedLong;

Property Descriptor As list Of SDC.ns1.AbstractDescriptor;

Storage Default
{
<Data name="GetDescriptorsFromArchiveResponseDefaultData">
<Subscript>"GetDescriptorsFromArchiveResponse"</Subscript>
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
<Value>Descriptor</Value>
</Value>
</Data>
<DefaultData>GetDescriptorsFromArchiveResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
