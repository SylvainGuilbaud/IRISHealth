/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.ScoState Extends SDC.ns1.AbstractDeviceComponentState [ CompileAfter = SDC.ns1.OperationRef, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "ScoState";

Property OperationGroup As list Of SDC.ns1.OperationGroup(XMLNAME = "OperationGroup", XMLPROJECTION = "ELEMENT");

Property InvocationRequested As SDC.ns1.OperationRef(XMLNAME = "InvocationRequested", XMLPROJECTION = "ATTRIBUTE");

Property InvocationRequired As SDC.ns1.OperationRef(XMLNAME = "InvocationRequired", XMLPROJECTION = "ATTRIBUTE");

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
<Value>CalibrationInfo</Value>
</Value>
<Value name="6">
<Value>NextCalibration</Value>
</Value>
<Value name="7">
<Value>PhysicalConnector</Value>
</Value>
<Value name="8">
<Value>ActivationState</Value>
</Value>
<Value name="9">
<Value>OperatingHours</Value>
</Value>
<Value name="10">
<Value>OperatingCycles</Value>
</Value>
<Value name="11">
<Value>OperationGroup</Value>
</Value>
<Value name="12">
<Value>InvocationRequested</Value>
</Value>
<Value name="13">
<Value>InvocationRequired</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
