/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.DistributionSampleArrayMetricState Extends SDC.ns1.AbstractMetricState [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "DistributionSampleArrayMetricState";

Property MetricValue As SDC.ns1.SampleArrayValue(XMLNAME = "MetricValue");

Property PhysiologicalRange As list Of SDC.ns1.Range(XMLNAME = "PhysiologicalRange", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="AbstractStateState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>StateVersion</Value>
</Value>
<Value name="3">
<Value>DescriptorHandle</Value>
</Value>
<Value name="4">
<Value>DescriptorVersion</Value>
</Value>
<Value name="5">
<Value>BodySite</Value>
</Value>
<Value name="6">
<Value>PhysicalConnector</Value>
</Value>
<Value name="7">
<Value>ActivationState</Value>
</Value>
<Value name="8">
<Value>ActiveDeterminationPeriod</Value>
</Value>
<Value name="9">
<Value>LifeTimePeriod</Value>
</Value>
<Value name="10">
<Value>MetricValue</Value>
</Value>
<Value name="11">
<Value>PhysiologicalRange</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
