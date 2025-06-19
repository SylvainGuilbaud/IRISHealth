Class msg.product Extends Ens.Request
{

Property SKU As %String;

Property Description As %String(MAXLEN = "");

Property Category As %String;

Property Status As %String(VALUELIST = ",actif,archivé,brouillon");

Property ts As %TimeStamp [ InitialExpression = {$zdt($h,3)} ];

Storage Default
{
<Data name="productDefaultData">
<Subscript>"product"</Subscript>
<Value name="1">
<Value>SKU</Value>
</Value>
<Value name="2">
<Value>Description</Value>
</Value>
<Value name="3">
<Value>Category</Value>
</Value>
<Value name="4">
<Value>Status</Value>
</Value>
<Value name="5">
<Value>ts</Value>
</Value>
</Data>
<DefaultData>productDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
