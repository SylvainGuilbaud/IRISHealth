/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.VmdState Extends SDC.ns1.AbstractComplexDeviceComponentState [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "VmdState";

Property OperatingJurisdiction As SDC.ns1.OperatingJurisdiction(XMLNAME = "OperatingJurisdiction");

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
<Value>OperatingJurisdiction</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
