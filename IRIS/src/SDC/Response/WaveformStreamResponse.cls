Class SDC.Response.WaveformStreamResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Extension As SDC.ns.ExtensionType;

Property MdibVersion As SDC.ns1.VersionCounter;

Property SequenceId As %xsd.anyURI;

Property InstanceId As %xsd.unsignedLong;

Property State As list Of SDC.ns1.RealTimeSampleArrayMetricState;

Storage Default
{
<Data name="WaveformStreamResponseDefaultData">
<Subscript>"WaveformStreamResponse"</Subscript>
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
<Value>State</Value>
</Value>
</Data>
<DefaultData>WaveformStreamResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
