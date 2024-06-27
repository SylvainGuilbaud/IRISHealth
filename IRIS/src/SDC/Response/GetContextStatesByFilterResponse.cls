Class SDC.Response.GetContextStatesByFilterResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Extension As SDC.ns.ExtensionType;

Property MdibVersion As SDC.ns1.VersionCounter;

Property SequenceId As %xsd.anyURI;

Property InstanceId As %xsd.unsignedLong;

Property ContextState As list Of SDC.ns1.AbstractContextState;

Storage Default
{
<Data name="GetContextStatesByFilterResponseDefaultData">
<Subscript>"GetContextStatesByFilterResponse"</Subscript>
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
<Value>ContextState</Value>
</Value>
</Data>
<DefaultData>GetContextStatesByFilterResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
