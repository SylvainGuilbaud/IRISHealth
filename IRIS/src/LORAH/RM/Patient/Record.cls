/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'LORAH.RM.Patient'
/// on 2024-07-23 at 12:25:49.629 [2024-07-23 11:25:49.629 UTC]
/// by user _SYSTEM
Class LORAH.RM.Patient.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property id As %String [ SqlColumnNumber = 2 ];

Property nom As %String [ SqlColumnNumber = 3 ];

Property prenom As %String [ SqlColumnNumber = 4 ];

Property datedenaissance As %String [ SqlColumnNumber = 5 ];

Property sexe As %String [ SqlColumnNumber = 6 ];

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
<Value name="8">
<Value>%ParentBatch</Value>
</Value>
</Data>
<DataLocation>^LORAH.RM.Patient.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^LORAH.RM.Patient.RecordD</IdLocation>
<IndexLocation>^LORAH.RM.Patient.RecordI</IndexLocation>
<StreamLocation>^LORAH.RM.Patient.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

Parameter RECORDMAPGENERATED = 1;

Relationship %ParentBatch As LORAH.RM.Patient.Batch [ Cardinality = one, Inverse = Records ];

Index %ParentBatchIdx On %ParentBatch;

}
