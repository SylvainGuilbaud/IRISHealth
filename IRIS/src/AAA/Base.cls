/// This class has been generated, modifications (even to descriptions) may prevent the system from deteriming structural changes
Class AAA.Base Extends (%Persistent, HS.HC.FHIRSQL.Utils.ResourceCommon) [ Abstract, GeneratedBy = HS.HC.FHIRSQL.Utils, Inheritance = right, ProcedureBlock, StorageStrategy = SQL ]
{

Parameter FHIRCORE = {$lb("hl7.fhir.r4.core@4.0.1")};

Parameter GLOBAL = "^HSF01R.RsrcD";

Parameter RESOURCETABLE = "HSFHIR_X0001_R.Rsrc";

Parameter RESOURCETYPE = "Abstract";

Parameter RepositoryId = 1;

Parameter SQLPREVENTFULLSCAN = 1;

Parameter SYSTEM = "55D86737-19E4-11F0-80F4-2270350488D5:IRISHealth:IRIS";

Property %FHIR As HS.HC.FHIRSQL.DataType.JSON [ Internal, Private, Required ];

Property Key As %String(COLLATION = "EXACT");

Property RowNum As %Integer [ Calculated, SqlComputeCode = { Set {*} = {ID} }, SqlComputed ];

Index KeyIndex On Key;

ClassMethod BitNext(pResourceType As %String, pL1 As %Integer) As %Integer
{
	Set node = (pL1\64000)+1,pos=pL1#64000+1
	Set pL1=""
	For {
		Set pos=$bitfind(^HSF01R.RsrcI("ResourceTypeIndex",pResourceType,node),1,pos+1) 
		if 'pos {
			Set node=$O(^HSF01R.RsrcI("ResourceTypeIndex",pResourceType,node)) 
			Quit:node=""
			Set pos=0
		} Else {
			Set pL1 = ((node-1)*64000)+pos-1
			Quit
		}
	}
	Quit pL1
}

XData Structure [ MimeType = application/json ]
{
{"classes":[{"name":"AAA.Patient","id":1,"props":{"PatientNameFamily":{"path":"Patient.name.family"},"PatientBirthDate":{"path":"Patient.birthDate"},"PatientGender":{"path":"Patient.gender"},"Prenom":{"path":"Patient.name.given"}}},{"name":"AAA.AllergyIntolerance","id":2,"props":{"AllergyIntoleranceCodeCodingDisplay":{"path":"AllergyIntolerance.code.coding.display"},"AllergyIntolerancePatientReference":{"path":"AllergyIntolerance.patient.reference"}}},{"name":"AAA.ExplanationOfBenefit","id":3,"props":{"ExplanationOfBenefitContainedCoveragePayorDisplay":{"path":"ExplanationOfBenefit.contained.Coverage.payor.display"},"ExplanationOfBenefitContainedCoverageTypeText":{"path":"ExplanationOfBenefit.contained.Coverage.type.text"},"ExplanationOfBenefitPatientReference":{"path":"ExplanationOfBenefit.patient.reference"}}},{"name":"AAA.Immunization","id":4,"props":{"ImmunizationVaccineCodeCodingDisplay":{"path":"Immunization.vaccineCode.coding.display"}}},{"name":"AAA.Observation","id":5,"props":{"ObservationSubjectReference":{"path":"Observation.subject.reference"},"ObservationValueCodeableConceptCodingDisplay":{"path":"Observation.valueCodeableConcept.coding.display"}}},{"name":"AAA.Organization","id":6,"props":{"OrganizationName":{"path":"Organization.name"}}},{"name":"AAA.Practitioner","id":7,"props":{"PractitionerAddressCity":{"path":"Practitioner.address.city"},"PractitionerGender":{"path":"Practitioner.gender"}}},{"name":"AAA.Procedure","id":8,"props":{"ProcedureCodeCodingDisplay":{"path":"Procedure.code.coding.display"},"ProcedureSubjectReference":{"path":"Procedure.subject.reference"}}}],"global":"^AAA.fhirsql","hip":8}
}

Storage SQL
{
<SQLMap name="KeyIndex">
<Global>^HSF01R.RsrcI</Global>
<Subscript name="1">
<Expression>"KeyIdx"</Expression>
</Subscript>
<Subscript name="2">
<Expression>{Key}</Expression>
</Subscript>
<Subscript name="3">
<Expression>{ID}</Expression>
</Subscript>
<Type>index</Type>
</SQLMap>
<SQLMap name="MasterMap">
<Data name="%FHIR">
<RetrievalCode> set {*} = ""</RetrievalCode>
</Data>
<Data name="Key">
<RetrievalCode> set {*} = $lg(^HSF01R.RsrcD({L1}),2)</RetrievalCode>
</Data>
<Global>^HSF01R.RsrcD</Global>
<Subscript name="1">
<Expression>{ID}</Expression>
<Invalidcondition name="1">
<Expression>'$D(^HSF01R.RsrcD({L1}))||($lg(^HSF01R.RsrcD({L1}),10)=1)||($lg(^HSF01R.RsrcD({L1}),3)'=##expression(""""_$parameter({%%CLASSNAMEQ},"RESOURCETYPE")_""""))</Expression>
</Invalidcondition>
<NextCode>Set {L1} = ##class(AAA.Base).BitNext(##expression(""""_$parameter({%%CLASSNAMEQ},"RESOURCETYPE")_""""),{L1})</NextCode>
</Subscript>
<Type>data</Type>
</SQLMap>
<StreamLocation>^MySchema.WeHaveNoStreams</StreamLocation>
<Type>%Storage.SQL</Type>
}

}
