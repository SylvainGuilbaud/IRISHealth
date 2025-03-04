/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'LORAH.demo.patient'
/// on 2024-07-24 at 13:07:55.166 [2024-07-24 12:07:55.166 UTC]
/// by user _SYSTEM
Class LORAH.demo.patient.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property id As %String [ SqlColumnNumber = 2 ];

Property nom As %String [ SqlColumnNumber = 3 ];

Property prenom As %String [ SqlColumnNumber = 4 ];

Property datedenaissance As %String [ SqlColumnNumber = 5 ];

Property sexe As %String [ SqlColumnNumber = 6 ];

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>id</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>prenom</Value>
</Value>
<Value name="5">
<Value>datedenaissance</Value>
</Value>
<Value name="6">
<Value>sexe</Value>
</Value>
<Value name="7">
<Value>nom</Value>
</Value>
</Data>
<DataLocation>^LORAH.demo.patient.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^LORAH.demo.patient.RecordD</IdLocation>
<IndexLocation>^LORAH.demo.patient.RecordI</IndexLocation>
<StreamLocation>^LORAH.demo.patient.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
