Class FHIR.request Extends Ens.Request
{

Property RequestPath As %String(MAXLEN = "") [ InitialExpression = "/Patient" ];

Property QueryString As %String(MAXLEN = "") [ InitialExpression = "identifier=http://hospital.smarthealthit.org|925287F4-20A4-11F0-B7B4-EA3B43076670" ];

Storage Default
{
<Data name="requestDefaultData">
<Subscript>"request"</Subscript>
<Value name="1">
<Value>RequestPath</Value>
</Value>
<Value name="2">
<Value>QueryString</Value>
</Value>
</Data>
<DefaultData>requestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
