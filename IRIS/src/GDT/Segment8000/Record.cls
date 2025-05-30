/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'GDT.Segment8000'
/// on 2025-05-30 at 14:43:40.512 [2025-05-30 13:43:40.512 UTC]
/// by user SuperUser
Class GDT.Segment8000.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Version As %Integer [ SqlColumnNumber = 3 ];

Property DateCreation As %Date(FORMAT = 8) [ SqlColumnNumber = 4 ];

Property NumEnr As %Integer [ SqlColumnNumber = 5 ];

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Version</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>NumEnr</Value>
</Value>
<Value name="5">
<Value>DateCreation</Value>
</Value>
</Data>
<DataLocation>^GDT.Segment8000.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^GDT.Segment8000.RecordD</IdLocation>
<IndexLocation>^GDT.Segment8000.RecordI</IndexLocation>
<StreamLocation>^GDT.Segment8000.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
