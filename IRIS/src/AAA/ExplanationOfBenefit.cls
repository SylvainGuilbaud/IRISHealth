/// This class has been generated, modifications (even to descriptions) may prevent the system from deteriming structural changes
Class AAA.ExplanationOfBenefit Extends AAA.Base [ GeneratedBy = HS.HC.FHIRSQL.Utils, Owner = {SuperUser}, ProcedureBlock, StorageStrategy = SQL ]
{

Parameter RESOURCETABLE = "HSFHIR_X0001_R.Rsrc";

Parameter RESOURCETYPE = "ExplanationOfBenefit";

/// Path: ExplanationOfBenefit.contained.Coverage.payor.display
Property ExplanationOfBenefitContainedCoveragePayorDisplay As %String(COLLATION = "SQLUPPER", MAXLEN = 50) [ Calculated, SqlComputeCode = {New temp Set temp={%FHIR} set {*} = ##class(AAA.ExplanationOfBenefit).ExtractFHIR(##class(AAA.ExplanationOfBenefit).LazyLoad({ID},.temp),"ExplanationOfBenefit.contained.Coverage.payor.display",,$lb("hl7.fhir.r4.core@4.0.1")) Set {%FHIR}=temp}, SqlComputed ];

/// Path: ExplanationOfBenefit.contained.Coverage.type.text
Property ExplanationOfBenefitContainedCoverageTypeText As %String(COLLATION = "SQLUPPER", MAXLEN = 50) [ Calculated, SqlComputeCode = {New temp Set temp={%FHIR} set {*} = ##class(AAA.ExplanationOfBenefit).ExtractFHIR(##class(AAA.ExplanationOfBenefit).LazyLoad({ID},.temp),"ExplanationOfBenefit.contained.Coverage.type.text",,$lb("hl7.fhir.r4.core@4.0.1")) Set {%FHIR}=temp}, SqlComputed ];

/// Path: ExplanationOfBenefit.patient.reference
Property ExplanationOfBenefitPatientReference As %String(COLLATION = "SQLUPPER", MAXLEN = 50) [ Calculated, SqlComputeCode = {New temp Set temp={%FHIR} set {*} = ##class(AAA.ExplanationOfBenefit).ExtractFHIR(##class(AAA.ExplanationOfBenefit).LazyLoad({ID},.temp),"ExplanationOfBenefit.patient.reference",,$lb("hl7.fhir.r4.core@4.0.1")) Set {%FHIR}=temp}, SqlComputed ];

Index "$ExplanationOfBenefit" [ Extent, Type = bitmap ];

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
<SQLMap name="$ExplanationOfBenefit">
<Global>^HSF01R.RsrcI</Global>
<Subscript name="1">
<Expression>"ResourceTypeIndex"</Expression>
</Subscript>
<Subscript name="2">
<Expression>"ExplanationOfBenefit"</Expression>
</Subscript>
<Type>bitmapextent</Type>
</SQLMap>
<Type>%Storage.SQL</Type>
}

}
