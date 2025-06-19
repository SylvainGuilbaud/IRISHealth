Class msg.products Extends Ens.Request
{

Property products As list Of msg.product;

Storage Default
{
<Data name="productsDefaultData">
<Subscript>"products"</Subscript>
<Value name="1">
<Value>products</Value>
</Value>
</Data>
<DefaultData>productsDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
