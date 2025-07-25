/// This class has been generated, modifications (even to descriptions) may prevent the system from deteriming structural changes
Class AAA.Observation Extends AAA.Base [ GeneratedBy = HS.HC.FHIRSQL.Utils, Owner = {SuperUser}, ProcedureBlock, StorageStrategy = SQL ]
{

Parameter RESOURCETABLE = "HSFHIR_X0001_R.Rsrc";

Parameter RESOURCETYPE = "Observation";

/// Path: Observation.subject.reference
Property ObservationSubjectReference As %String(COLLATION = "SQLUPPER", MAXLEN = 50) [ Calculated, SqlComputeCode = {New temp Set temp={%FHIR} set {*} = ##class(AAA.Observation).ExtractFHIR(##class(AAA.Observation).LazyLoad({ID},.temp),"Observation.subject.reference",,$lb("hl7.fhir.r4.core@4.0.1")) Set {%FHIR}=temp}, SqlComputed ];

/// Path: Observation.valueCodeableConcept.coding.display
Property ObservationValueCodeableConceptCodingDisplay As %String(COLLATION = "SQLUPPER", MAXLEN = 50) [ Calculated, SqlComputeCode = {New temp Set temp={%FHIR} set {*} = ##class(AAA.Observation).ExtractFHIR(##class(AAA.Observation).LazyLoad({ID},.temp),"Observation.valueCodeableConcept.coding.display",,$lb("hl7.fhir.r4.core@4.0.1")) Set {%FHIR}=temp}, SqlComputed ];

Index "$Observation" [ Extent, Type = bitmap ];

ClassMethod %OnBeforeBuildIndices(ByRef pIndexList As %String(MAXLEN="") = "") As %Status
{
	Quit $$$ERROR($$$FHIRSQLErrNothingToBuild)
}

ClassMethod %OnBeforePurgeIndices(ByRef pIndexList As %String(MAXLEN="") = "") As %Status
{
	Quit $$$ERROR($$$FHIRSQLErrNothingToPurge)
}

ClassMethod LazyLoad(pID As %Integer, ByRef pStorage As %DynamicObject) As %DynamicObject
{
	If $G(pStorage)="" {
		Set pStorage =..GetFHIRData(pID,..#GLOBAL)
	}
	Quit pStorage
}

ClassMethod UpdateIndices(pKey As %String, pAdd As %Boolean = 1) As %Status
{
	Quit $$$OK
}

Storage SQL
{
<SQLMap name="$Observation">
<Global>^HSF01R.RsrcI</Global>
<Subscript name="1">
<Expression>"ResourceTypeIndex"</Expression>
</Subscript>
<Subscript name="2">
<Expression>"Observation"</Expression>
</Subscript>
<Type>bitmapextent</Type>
</SQLMap>
<Type>%Storage.SQL</Type>
}

}
