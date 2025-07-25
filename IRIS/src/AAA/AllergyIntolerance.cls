/// This class has been generated, modifications (even to descriptions) may prevent the system from deteriming structural changes
Class AAA.AllergyIntolerance Extends AAA.Base [ GeneratedBy = HS.HC.FHIRSQL.Utils, Owner = {SuperUser}, ProcedureBlock, StorageStrategy = SQL ]
{

Parameter RESOURCETABLE = "HSFHIR_X0001_R.Rsrc";

Parameter RESOURCETYPE = "AllergyIntolerance";

/// Path: AllergyIntolerance.code.coding.display
Property AllergyIntoleranceCodeCodingDisplay As %String(COLLATION = "SQLUPPER", MAXLEN = 50) [ Calculated, SqlComputeCode = {New temp Set temp={%FHIR} set {*} = ##class(AAA.AllergyIntolerance).ExtractFHIR(##class(AAA.AllergyIntolerance).LazyLoad({ID},.temp),"AllergyIntolerance.code.coding.display",,$lb("hl7.fhir.r4.core@4.0.1")) Set {%FHIR}=temp}, SqlComputed ];

/// Path: AllergyIntolerance.patient.reference
Property AllergyIntolerancePatientReference As %String(COLLATION = "SQLUPPER", MAXLEN = 50) [ Calculated, SqlComputeCode = {New temp Set temp={%FHIR} set {*} = ##class(AAA.AllergyIntolerance).ExtractFHIR(##class(AAA.AllergyIntolerance).LazyLoad({ID},.temp),"AllergyIntolerance.patient.reference",,$lb("hl7.fhir.r4.core@4.0.1")) Set {%FHIR}=temp}, SqlComputed ];

Index "$AllergyIntolerance" [ Extent, Type = bitmap ];

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
<SQLMap name="$AllergyIntolerance">
<Global>^HSF01R.RsrcI</Global>
<Subscript name="1">
<Expression>"ResourceTypeIndex"</Expression>
</Subscript>
<Subscript name="2">
<Expression>"AllergyIntolerance"</Expression>
</Subscript>
<Type>bitmapextent</Type>
</SQLMap>
<Type>%Storage.SQL</Type>
}

}
