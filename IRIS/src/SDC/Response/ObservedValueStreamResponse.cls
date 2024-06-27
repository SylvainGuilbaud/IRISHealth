Class SDC.Response.ObservedValueStreamResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Extension As SDC.ns.ExtensionType;

Property MdibVersion As SDC.ns1.VersionCounter;

Property SequenceId As %xsd.anyURI;

Property InstanceId As %xsd.unsignedLong;

Property Value As list Of SDC.msg.Value;

Storage Default
{
<Data name="ObservedValueStreamResponseDefaultData">
<Subscript>"ObservedValueStreamResponse"</Subscript>
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
<Value>Value</Value>
</Value>
</Data>
<DefaultData>ObservedValueStreamResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
