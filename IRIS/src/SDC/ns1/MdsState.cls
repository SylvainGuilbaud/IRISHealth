/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.MdsState Extends SDC.ns1.AbstractComplexDeviceComponentState [ CompileAfter = SDC.ns1.MdsOperatingMode, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "MdsState";

Property OperatingJurisdiction As SDC.ns1.OperatingJurisdiction(XMLNAME = "OperatingJurisdiction");

Property Lang As %String(MAXLEN = "", XMLNAME = "Lang", XMLPROJECTION = "ATTRIBUTE");

Property OperatingMode As SDC.ns1.MdsOperatingMode(XMLNAME = "OperatingMode", XMLPROJECTION = "ATTRIBUTE");

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
<Value name="12">
<Value>Lang</Value>
</Value>
<Value name="13">
<Value>OperatingMode</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
