/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.PatientDemographicsCoreData Extends SDC.ns1.BaseDemographics [ CompileAfter = (SDC.ns1.PatientType, SDC.ns1.Sex), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "PatientDemographicsCoreData";

Property Sex As SDC.ns1.Sex(XMLNAME = "Sex");

Property PatientType As SDC.ns1.PatientType(XMLNAME = "PatientType");

Property DateOfBirth As %String(MAXLEN = "", XMLNAME = "DateOfBirth");

Property Height As SDC.ns1.Measurement(XMLNAME = "Height");

Property Weight As SDC.ns1.Measurement(XMLNAME = "Weight");

Property Race As SDC.ns1.CodedValue(XMLNAME = "Race");

Storage Default
{
<Data name="BaseDemographicsState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Givenname</Value>
</Value>
<Value name="3">
<Value>Middlename</Value>
</Value>
<Value name="4">
<Value>Familyname</Value>
</Value>
<Value name="5">
<Value>Birthname</Value>
</Value>
<Value name="6">
<Value>Title</Value>
</Value>
<Value name="7">
<Value>Sex</Value>
</Value>
<Value name="8">
<Value>PatientType</Value>
</Value>
<Value name="9">
<Value>DateOfBirth</Value>
</Value>
<Value name="10">
<Value>Height</Value>
</Value>
<Value name="11">
<Value>Weight</Value>
</Value>
<Value name="12">
<Value>Race</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
