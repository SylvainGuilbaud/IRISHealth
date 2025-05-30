/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'GDT.Segment5200'
/// on 2025-05-30 at 14:07:55.034 [2025-05-30 13:07:55.034 UTC]
/// by user SuperUser
Class GDT.Segment5200.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property NumExam As %String [ SqlColumnNumber = 3 ];

Property Fichier As %String [ SqlColumnNumber = 4 ];

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>NumExam</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Fichier</Value>
</Value>
</Data>
<DataLocation>^GDT.Segment5200.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^GDT.Segment5200.RecordD</IdLocation>
<IndexLocation>^GDT.Segment5200.RecordI</IndexLocation>
<StreamLocation>^GDT.Segment5200.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
