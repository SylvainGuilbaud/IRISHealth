Class data.product Extends %Persistent
{

Index SKUIndex On SKU [ Unique ];

Property SKU As %String [ Required ];

Property Description As %String(MAXLEN = "");

Property Category As %String;

Property Status As %String(VALUELIST = ",actif,archivé,brouillon");

Property ts As %TimeStamp [ InitialExpression = {$zdt($h,3)} ];

Storage Default
{
<Data name="productDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SKU</Value>
</Value>
<Value name="3">
<Value>Description</Value>
</Value>
<Value name="4">
<Value>Category</Value>
</Value>
<Value name="5">
<Value>Status</Value>
</Value>
<Value name="6">
<Value>ts</Value>
</Value>
</Data>
<DataLocation>^data.productD</DataLocation>
<DefaultData>productDefaultData</DefaultData>
<IdLocation>^data.productD</IdLocation>
<IndexLocation>^data.productI</IndexLocation>
<StreamLocation>^data.productS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
