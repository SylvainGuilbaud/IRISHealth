/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'GDT.Segment3100'
/// on 2025-05-30 at 14:14:39.096 [2025-05-30 13:14:39.096 UTC]
/// by user SuperUser
Class GDT.Segment3100.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Nom As %String(MAXLEN = "") [ SqlColumnNumber = 3 ];

Property Prenom As %String(MAXLEN = "") [ SqlColumnNumber = 4 ];

Property DateNaissance As %String [ SqlColumnNumber = 5 ];

Property Sexe As %String [ SqlColumnNumber = 6 ];

Property Adresse As %String(MAXLEN = "") [ SqlColumnNumber = 7 ];

Property CodePostal As %String [ SqlColumnNumber = 8 ];

Property Ville As %String(MAXLEN = "") [ SqlColumnNumber = 9 ];

Property Pays As %String(MAXLEN = "") [ SqlColumnNumber = 10 ];

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Nom</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>DateNaissance</Value>
</Value>
<Value name="5">
<Value>Sexe</Value>
</Value>
<Value name="6">
<Value>Adresse</Value>
</Value>
<Value name="7">
<Value>CodePostal</Value>
</Value>
<Value name="8">
<Value>Ville</Value>
</Value>
<Value name="9">
<Value>Pays</Value>
</Value>
<Value name="10">
<Value>Prenom</Value>
</Value>
</Data>
<DataLocation>^GDT.Segment3100.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^GDT.Segment3100.RecordD</IdLocation>
<IndexLocation>^GDT.Segment3100.RecordI</IndexLocation>
<StreamLocation>^GDT.Segment3100.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
