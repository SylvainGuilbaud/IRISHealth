Class HTTP.FHIR.response Extends Ens.Response
{

Property json As %String(MAXLEN = "");

Storage Default
{
<Data name="responseDefaultData">
<Subscript>"response"</Subscript>
<Value name="1">
<Value>json</Value>
</Value>
</Data>
<DefaultData>responseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
