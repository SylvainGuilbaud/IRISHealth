/// This class has been generated, modifications (even to descriptions) may prevent the system from deteriming structural changes
Class AAA.Patient Extends AAA.Base [ GeneratedBy = HS.HC.FHIRSQL.Utils, Owner = {SuperUser}, ProcedureBlock, StorageStrategy = SQL ]
{

Parameter RESOURCETABLE = "HSFHIR_X0001_R.Rsrc";

Parameter RESOURCETYPE = "Patient";

/// Path: Patient.birthDate
Property PatientBirthDate As %String(COLLATION = "SQLUPPER", MAXLEN = 10) [ Calculated, SqlComputeCode = {New temp Set temp={%FHIR} set {*} = ##class(AAA.Patient).ExtractFHIR(##class(AAA.Patient).LazyLoad({ID},.temp),"Patient.birthDate",,$lb("hl7.fhir.r4.core@4.0.1")) Set {%FHIR}=temp}, SqlComputed ];

/// Path: Patient.gender
Property PatientGender As %String(COLLATION = "SQLUPPER", MAXLEN = 10) [ Calculated, SqlComputeCode = {New temp Set temp={%FHIR} set {*} = ##class(AAA.Patient).ExtractFHIR(##class(AAA.Patient).LazyLoad({ID},.temp),"Patient.gender",,$lb("hl7.fhir.r4.core@4.0.1")) Set {%FHIR}=temp}, SqlComputed ];

/// Path: Patient.name.family
Property PatientNameFamily As %String(COLLATION = "SQLUPPER", MAXLEN = 50) [ Calculated, SqlComputeCode = {New temp Set temp={%FHIR} set {*} = ##class(AAA.Patient).ExtractFHIR(##class(AAA.Patient).LazyLoad({ID},.temp),"Patient.name.family",,$lb("hl7.fhir.r4.core@4.0.1")) Set {%FHIR}=temp}, SqlComputed ];

/// Path: Patient.name.given
Property Prenom As %String(COLLATION = "SQLUPPER", MAXLEN = 50) [ Calculated, SqlComputeCode = {New temp Set temp={%FHIR} set {*} = ##class(AAA.Patient).ExtractFHIR(##class(AAA.Patient).LazyLoad({ID},.temp),"Patient.name.given",,$lb("hl7.fhir.r4.core@4.0.1")) Set {%FHIR}=temp}, SqlComputed ];

Index "$Patient" [ Extent, Type = bitmap ];

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
<SQLMap name="$Patient">
<Global>^HSF01R.RsrcI</Global>
<Subscript name="1">
<Expression>"ResourceTypeIndex"</Expression>
</Subscript>
<Subscript name="2">
<Expression>"Patient"</Expression>
</Subscript>
<Type>bitmapextent</Type>
</SQLMap>
<Type>%Storage.SQL</Type>
}

}
