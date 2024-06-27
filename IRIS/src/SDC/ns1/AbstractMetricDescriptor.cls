/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AbstractMetricDescriptor Extends SDC.ns1.AbstractDescriptor [ CompileAfter = (SDC.ns1.DerivationMethod, SDC.ns1.MetricAvailability, SDC.ns1.MetricCategory), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "AbstractMetricDescriptor";

Property Unit As SDC.ns1.CodedValue(XMLNAME = "Unit") [ Required ];

Property BodySite As list Of SDC.ns1.CodedValue(XMLNAME = "BodySite", XMLPROJECTION = "ELEMENT");

Property Relation As list Of SDC.ns1.Relation(XMLNAME = "Relation", XMLPROJECTION = "ELEMENT");

Property MetricCategory As SDC.ns1.MetricCategory(XMLNAME = "MetricCategory", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property DerivationMethod As SDC.ns1.DerivationMethod(XMLNAME = "DerivationMethod", XMLPROJECTION = "ATTRIBUTE");

Property MetricAvailability As SDC.ns1.MetricAvailability(XMLNAME = "MetricAvailability", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property MaxMeasurementTime As %String(MAXLEN = "", XMLNAME = "MaxMeasurementTime", XMLPROJECTION = "ATTRIBUTE");

Property MaxDelayTime As %String(MAXLEN = "", XMLNAME = "MaxDelayTime", XMLPROJECTION = "ATTRIBUTE");

Property DeterminationPeriod As %String(MAXLEN = "", XMLNAME = "DeterminationPeriod", XMLPROJECTION = "ATTRIBUTE");

Property LifeTimePeriod As %String(MAXLEN = "", XMLNAME = "LifeTimePeriod", XMLPROJECTION = "ATTRIBUTE");

Property ActivationDuration As %String(MAXLEN = "", XMLNAME = "ActivationDuration", XMLPROJECTION = "ATTRIBUTE");

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
</Data>
<Type>%Storage.Serial</Type>
}

}
