/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Modified during compilation of Complex RecordMap 'GDT.GDT'
/// on 2025-05-30 at 14:16:14.309 [2025-05-30 13:16:14.309 UTC]
/// by user SuperUser
Class GDT.GDT.Batch Extends (EnsLib.RecordMap.ComplexBatch, Ens.Request) [ Inheritance = right, ProcedureBlock ]
{

Parameter RECORDMAPGENERATED = 1;

Property S8000 As GDT.Segment8000.Record [ Required ];

Property S3100 As GDT.Segment3100.Record [ Required ];

Property S5100 As GDT.Segment5100.Record [ Required ];

Property S5200 As GDT.Segment5200.Record;

Method %OnClose() As %Status [ Private, ServerOnly = 1 ]
{
	Set tStatus = $$$OK
	Try {
		Set tId = ..%Id()
		If ""=tId {
		}
	} Catch ex {
		Set tStatus = $$$SystemError
	}
	Quit tStatus
}

Storage Default
{
<Data name="BatchDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>S8000</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>S5100</Value>
</Value>
<Value name="5">
<Value>S5200</Value>
</Value>
<Value name="6">
<Value>S3100</Value>
</Value>
</Data>
<DataLocation>^GDT.GDT.BatchD</DataLocation>
<DefaultData>BatchDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^GDT.GDT.BatchD</IdLocation>
<IndexLocation>^GDT.GDT.BatchI</IndexLocation>
<StreamLocation>^GDT.GDT.BatchS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
