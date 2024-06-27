Class SDC.Response.GetLocalizedTextResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Extension As SDC.ns.ExtensionType;

Property MdibVersion As SDC.ns1.VersionCounter;

Property SequenceId As %xsd.anyURI;

Property InstanceId As %xsd.unsignedLong;

Property Text As list Of SDC.ns1.LocalizedText;

Storage Default
{
<Data name="GetLocalizedTextResponseDefaultData">
<Subscript>"GetLocalizedTextResponse"</Subscript>
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
<Value>Text</Value>
</Value>
</Data>
<DefaultData>GetLocalizedTextResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
