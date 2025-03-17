Class IRISHealth.msg.pdf Extends Ens.Request
{

Property doc As %Stream.GlobalBinary;

Property name As %String(MAXLEN = 1000);

Storage Default
{
<Data name="pdfDefaultData">
<Subscript>"pdf"</Subscript>
<Value name="1">
<Value>doc</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DefaultData>pdfDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
