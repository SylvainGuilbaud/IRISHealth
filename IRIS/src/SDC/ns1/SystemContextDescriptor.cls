/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.SystemContextDescriptor Extends SDC.ns1.AbstractDeviceComponentDescriptor [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "SystemContextDescriptor";

Property PatientContext As SDC.ns1.PatientContextDescriptor(XMLNAME = "PatientContext");

Property LocationContext As SDC.ns1.LocationContextDescriptor(XMLNAME = "LocationContext");

Property EnsembleContext As list Of SDC.ns1.EnsembleContextDescriptor(XMLNAME = "EnsembleContext", XMLPROJECTION = "ELEMENT");

Property OperatorContext As list Of SDC.ns1.OperatorContextDescriptor(XMLNAME = "OperatorContext", XMLPROJECTION = "ELEMENT");

Property WorkflowContext As list Of SDC.ns1.WorkflowContextDescriptor(XMLNAME = "WorkflowContext", XMLPROJECTION = "ELEMENT");

Property MeansContext As list Of SDC.ns1.MeansContextDescriptor(XMLNAME = "MeansContext", XMLPROJECTION = "ELEMENT");

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
<Value>ProductionSpecification</Value>
</Value>
<Value name="7">
<Value>PatientContext</Value>
</Value>
<Value name="8">
<Value>LocationContext</Value>
</Value>
<Value name="9">
<Value>EnsembleContext</Value>
</Value>
<Value name="10">
<Value>OperatorContext</Value>
</Value>
<Value name="11">
<Value>WorkflowContext</Value>
</Value>
<Value name="12">
<Value>MeansContext</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
