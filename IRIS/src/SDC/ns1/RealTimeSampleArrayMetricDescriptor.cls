/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.RealTimeSampleArrayMetricDescriptor Extends SDC.ns1.AbstractMetricDescriptor [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "RealTimeSampleArrayMetricDescriptor";

Property TechnicalRange As list Of SDC.ns1.Range(XMLNAME = "TechnicalRange", XMLPROJECTION = "ELEMENT");

Property Resolution As %Numeric(XMLNAME = "Resolution", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property SamplePeriod As %String(MAXLEN = "", XMLNAME = "SamplePeriod", XMLPROJECTION = "ATTRIBUTE") [ Required ];

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
<Value>Resolution</Value>
</Value>
<Value name="19">
<Value>SamplePeriod</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
