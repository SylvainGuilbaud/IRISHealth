/// RECORDMAP: Modified during compilation of RecordMap 'LORAH.RM.Patient'
/// on 2024-07-23 at 12:25:49.634 [2024-07-23 11:25:49.634 UTC]
/// by user _SYSTEM
Class LORAH.RM.Patient.Batch Extends (%Library.Persistent, EnsLib.RecordMap.SimpleBatch) [ Inheritance = right, ProcedureBlock ]
{

Parameter XMLNAME = "patientBatch";

Parameter RECORDMAPGENERATED = 1;

Parameter BatchHeader = "id, nom, prenom, datedenaissance, sexe";

Parameter HeaderTerm = "\x0a";

Parameter BatchTrailer;

Parameter TrailerTerm;

Parameter IgnoreLeadingData = 0;

Relationship Records As LORAH.RM.Patient.Record [ Cardinality = many, Inverse = %ParentBatch ];

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ..deleteRecords({ID})
}

Parameter XMLTYPE = "patientBatchOut";

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
<DataLocation>^LORAH.RM.Patient.BatchD</DataLocation>
<DefaultData>BatchDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^LORAH.RM.Patient.BatchD</IdLocation>
<IndexLocation>^LORAH.RM.Patient.BatchI</IndexLocation>
<StreamLocation>^LORAH.RM.Patient.BatchS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
