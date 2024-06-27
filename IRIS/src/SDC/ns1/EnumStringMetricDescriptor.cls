/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.EnumStringMetricDescriptor Extends SDC.ns1.StringMetricDescriptor [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "EnumStringMetricDescriptor";

Property AllowedValue As list Of SDC.ns1.AllowedValue(XMLNAME = "AllowedValue", XMLPROJECTION = "ELEMENT") [ Required ];

Storage Default
{
<Data name="AbstractDescriptorState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Type</Value>
</Value>
<Value name="3">
<Value>Handle</Value>
</Value>
<Value name="4">
<Value>DescriptorVersion</Value>
</Value>
<Value name="5">
<Value>SafetyClassification</Value>
</Value>
<Value name="6">
<Value>Unit</Value>
</Value>
<Value name="7">
<Value>BodySite</Value>
</Value>
<Value name="8">
<Value>Relation</Value>
</Value>
<Value name="9">
<Value>MetricCategory</Value>
</Value>
<Value name="10">
<Value>DerivationMethod</Value>
</Value>
<Value name="11">
<Value>MetricAvailability</Value>
</Value>
<Value name="12">
<Value>MaxMeasurementTime</Value>
</Value>
<Value name="13">
<Value>MaxDelayTime</Value>
</Value>
<Value name="14">
<Value>DeterminationPeriod</Value>
</Value>
<Value name="15">
<Value>LifeTimePeriod</Value>
</Value>
<Value name="16">
<Value>ActivationDuration</Value>
</Value>
<Value name="17">
<Value>AllowedValue</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
