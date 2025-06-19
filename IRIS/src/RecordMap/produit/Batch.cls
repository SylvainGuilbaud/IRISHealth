/// RECORDMAP: Modified during compilation of RecordMap 'RecordMap.produit'
/// on 2025-06-19 at 12:06:52.133 [2025-06-19 11:06:52.133 UTC]
/// by user SuperUser
Class RecordMap.produit.Batch Extends (%Library.Persistent, EnsLib.RecordMap.SimpleBatch)
{

Parameter XMLNAME = "RecordMap_produit_Batch";

Parameter RECORDMAPGENERATED = 1;

Parameter BatchHeader;

Parameter HeaderTerm = "\x0a";

Parameter BatchTrailer;

Parameter TrailerTerm = "\x0a";

Parameter IgnoreLeadingData = 0;

Relationship Records As RecordMap.produit.Record [ Cardinality = many, Inverse = %ParentBatch ];

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ..deleteRecords({ID})
}

Parameter XMLTYPE = "RecordMap_produit_Batch";

Storage Default
{
<Data name="BatchDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>%Source</Value>
</Value>
<Value name="3">
<Value>BatchHeader</Value>
</Value>
<Value name="4">
<Value>BatchTrailer</Value>
</Value>
</Data>
<DataLocation>^RecordMap.produit.BatchD</DataLocation>
<DefaultData>BatchDefaultData</DefaultData>
<IdLocation>^RecordMap.produit.BatchD</IdLocation>
<IndexLocation>^RecordMap.produit.BatchI</IndexLocation>
<StreamLocation>^RecordMap.produit.BatchS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
