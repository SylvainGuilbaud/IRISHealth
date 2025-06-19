/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'RecordMap.produit'
/// on 2025-06-19 at 12:06:52.042 [2025-06-19 11:06:52.042 UTC]
/// by user SuperUser
Class RecordMap.produit.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property SKU As %String;

Property Description As %String(MAXLEN = "");

Property Categorie As %String;

Property Poids As %Numeric;

/// taille, couleur, etc.
Property Options As %String(MAXLEN = "");

Property Statut As %String(VALUELIST = ",actif,archivé,brouillon");

Parameter RECORDMAPGENERATED = 1;

Relationship %ParentBatch As RecordMap.produit.Batch [ Cardinality = one, Inverse = Records ];

Index %ParentBatchIdx On %ParentBatch;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SKU</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Categorie</Value>
</Value>
<Value name="5">
<Value>Poids</Value>
</Value>
<Value name="6">
<Value>Options</Value>
</Value>
<Value name="7">
<Value>Statut</Value>
</Value>
<Value name="8">
<Value>%ParentBatch</Value>
</Value>
<Value name="9">
<Value>Description</Value>
</Value>
</Data>
<DataLocation>^RecordMap.produit.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^RecordMap.produit.RecordD</IdLocation>
<IndexLocation>^RecordMap.produit.RecordI</IndexLocation>
<StreamLocation>^RecordMap.produit.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
