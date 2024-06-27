/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.NeonatalPatientDemographicsCoreData Extends SDC.ns1.PatientDemographicsCoreData [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "NeonatalPatientDemographicsCoreData";

Property GestationalAge As SDC.ns1.Measurement(XMLNAME = "GestationalAge");

Property BirthLength As SDC.ns1.Measurement(XMLNAME = "BirthLength");

Property BirthWeight As SDC.ns1.Measurement(XMLNAME = "BirthWeight");

Property HeadCircumference As SDC.ns1.Measurement(XMLNAME = "HeadCircumference");

Property Mother As SDC.ns1.PersonReference(CLASSNAME = 1, XMLNAME = "Mother");

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
<Value name="13">
<Value>GestationalAge</Value>
</Value>
<Value name="14">
<Value>BirthLength</Value>
</Value>
<Value name="15">
<Value>BirthWeight</Value>
</Value>
<Value name="16">
<Value>HeadCircumference</Value>
</Value>
<Value name="17">
<Value>Mother</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
