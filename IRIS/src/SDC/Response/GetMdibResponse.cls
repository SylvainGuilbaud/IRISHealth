Class SDC.Response.GetMdibResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Extension As SDC.ns.ExtensionType;

Property MdibVersion As SDC.ns1.VersionCounter;

Property SequenceId As %xsd.anyURI;

Property InstanceId As %xsd.unsignedLong;

Property Mdib As SDC.ns1.Mdib;

Storage Default
{
<Data name="GetMdibResponseDefaultData">
<Subscript>"GetMdibResponse"</Subscript>
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
<Value>Mdib</Value>
</Value>
</Data>
<DefaultData>GetMdibResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
