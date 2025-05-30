/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'GDT.Segment5100'
/// on 2025-05-30 at 14:15:25.851 [2025-05-30 13:15:25.851 UTC]
/// by user SuperUser
Class GDT.Segment5100.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property NumExam As %String [ SqlColumnNumber = 3 ];

Property TypeExam As %String(MAXLEN = "") [ SqlColumnNumber = 4 ];

Property DateExamen As %String [ SqlColumnNumber = 5 ];

Property HeureExam As %String [ SqlColumnNumber = 6 ];

Property MedecinReferent As %String(MAXLEN = "") [ SqlColumnNumber = 7 ];

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
<Value>DateExamen</Value>
</Value>
<Value name="5">
<Value>HeureExam</Value>
</Value>
<Value name="6">
<Value>MedecinReferent</Value>
</Value>
<Value name="7">
<Value>TypeExam</Value>
</Value>
</Data>
<DataLocation>^GDT.Segment5100.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^GDT.Segment5100.RecordD</IdLocation>
<IndexLocation>^GDT.Segment5100.RecordI</IndexLocation>
<StreamLocation>^GDT.Segment5100.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
