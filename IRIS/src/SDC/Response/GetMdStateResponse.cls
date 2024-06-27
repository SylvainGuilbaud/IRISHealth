Class SDC.Response.GetMdStateResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Extension As SDC.ns.ExtensionType;

Property MdibVersion As SDC.ns1.VersionCounter;

Property SequenceId As %xsd.anyURI;

Property InstanceId As %xsd.unsignedLong;

Property MdState As SDC.ns1.MdState;

Storage Default
{
<Data name="GetMdStateResponseDefaultData">
<Subscript>"GetMdStateResponse"</Subscript>
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
<Value>MdState</Value>
</Value>
</Data>
<DefaultData>GetMdStateResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
