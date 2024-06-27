Class SDC.Response.GetContainmentTreeResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Extension As SDC.ns.ExtensionType;

Property MdibVersion As SDC.ns1.VersionCounter;

Property SequenceId As %xsd.anyURI;

Property InstanceId As %xsd.unsignedLong;

Property ContainmentTree As SDC.ns1.ContainmentTree;

Storage Default
{
<Data name="GetContainmentTreeResponseDefaultData">
<Subscript>"GetContainmentTreeResponse"</Subscript>
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
<Value>ContainmentTree</Value>
</Value>
</Data>
<DefaultData>GetContainmentTreeResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
