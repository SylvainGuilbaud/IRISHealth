Class SDC.Request.GetMdibRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "SDC.Response.GetMdibResponse";

Property Extension As SDC.ns.ExtensionType;

Storage Default
{
<Data name="GetMdibRequestDefaultData">
<Subscript>"GetMdibRequest"</Subscript>
<Value name="1">
<Value>Extension</Value>
</Value>
</Data>
<DefaultData>GetMdibRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
