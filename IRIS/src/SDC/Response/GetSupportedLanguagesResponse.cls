Class SDC.Response.GetSupportedLanguagesResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Extension As SDC.ns.ExtensionType;

Property MdibVersion As SDC.ns1.VersionCounter;

Property SequenceId As %xsd.anyURI;

Property InstanceId As %xsd.unsignedLong;

Property Lang As list Of %String;

Storage Default
{
<Data name="GetSupportedLanguagesResponseDefaultData">
<Subscript>"GetSupportedLanguagesResponse"</Subscript>
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
<Value>Lang</Value>
</Value>
</Data>
<DefaultData>GetSupportedLanguagesResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
