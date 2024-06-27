/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.DistributionSampleArrayMetricDescriptor Extends SDC.ns1.AbstractMetricDescriptor [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "DistributionSampleArrayMetricDescriptor";

Property TechnicalRange As list Of SDC.ns1.Range(XMLNAME = "TechnicalRange", XMLPROJECTION = "ELEMENT");

Property DomainUnit As SDC.ns1.CodedValue(XMLNAME = "DomainUnit") [ Required ];

Property DistributionRange As SDC.ns1.Range(XMLNAME = "DistributionRange") [ Required ];

Property Resolution As %Numeric(XMLNAME = "Resolution", XMLPROJECTION = "ATTRIBUTE") [ Required ];

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
<Value>TechnicalRange</Value>
</Value>
<Value name="18">
<Value>DomainUnit</Value>
</Value>
<Value name="19">
<Value>DistributionRange</Value>
</Value>
<Value name="20">
<Value>Resolution</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
