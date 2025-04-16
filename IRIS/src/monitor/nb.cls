Class monitor.nb Extends %Persistent
{

Property label As %String(MAXLEN = 255);

Property nb As %Integer;

Property ts As %TimeStamp [ InitialExpression = {$zdt($h,3)} ];

Storage Default
{
<Data name="nbDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>label</Value>
</Value>
<Value name="3">
<Value>nb</Value>
</Value>
<Value name="4">
<Value>ts</Value>
</Value>
</Data>
<DataLocation>^monitor.nbD</DataLocation>
<DefaultData>nbDefaultData</DefaultData>
<IdLocation>^monitor.nbD</IdLocation>
<IndexLocation>^monitor.nbI</IndexLocation>
<StreamLocation>^monitor.nbS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
