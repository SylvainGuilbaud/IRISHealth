Class FHIR.data Extends Ens.Request
{

Property lastname As %String(MAXLEN = "") [ InitialExpression = "Doe" ];

Property firstname As %String(MAXLEN = "") [ InitialExpression = "John" ];

Property birthDate As %TimeStamp [ InitialExpression = "1990-01-01" ];

Storage Default
{
<Data name="dataDefaultData">
<Subscript>"data"</Subscript>
<Value name="1">
<Value>lastname</Value>
</Value>
<Value name="2">
<Value>firstname</Value>
</Value>
<Value name="3">
<Value>birthDate</Value>
</Value>
</Data>
<DefaultData>dataDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
