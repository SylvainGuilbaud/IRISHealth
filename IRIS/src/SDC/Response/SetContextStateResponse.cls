Class SDC.Response.SetContextStateResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Extension As SDC.ns.ExtensionType;

Property InvocationInfo As SDC.msg.InvocationInfo;

Property MdibVersion As SDC.ns1.VersionCounter;

Property SequenceId As %xsd.anyURI;

Property InstanceId As %xsd.unsignedLong;

Storage Default
{
<Data name="SetContextStateResponseDefaultData">
<Subscript>"SetContextStateResponse"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>InvocationInfo</Value>
</Value>
<Value name="3">
<Value>MdibVersion</Value>
</Value>
<Value name="4">
<Value>SequenceId</Value>
</Value>
<Value name="5">
<Value>InstanceId</Value>
</Value>
</Data>
<DefaultData>SetContextStateResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
