/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.BatteryState Extends SDC.ns1.AbstractDeviceComponentState [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "BatteryState";

Property CapacityRemaining As SDC.ns1.Measurement(XMLNAME = "CapacityRemaining");

Property Voltage As SDC.ns1.Measurement(XMLNAME = "Voltage");

Property Current As SDC.ns1.Measurement(XMLNAME = "Current") [ SqlFieldName = _Current ];

Property Temperature As SDC.ns1.Measurement(XMLNAME = "Temperature");

Property RemainingBatteryTime As SDC.ns1.Measurement(XMLNAME = "RemainingBatteryTime");

Property ChargeStatus As %String(MAXLEN = "", VALUELIST = ",Ful,ChB,DisChB,DEB", XMLNAME = "ChargeStatus", XMLPROJECTION = "ATTRIBUTE");

Property ChargeCycles As %xsd.unsignedInt(XMLNAME = "ChargeCycles", XMLPROJECTION = "ATTRIBUTE");

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
<Value>CapacityRemaining</Value>
</Value>
<Value name="12">
<Value>Voltage</Value>
</Value>
<Value name="13">
<Value>Current</Value>
</Value>
<Value name="14">
<Value>Temperature</Value>
</Value>
<Value name="15">
<Value>RemainingBatteryTime</Value>
</Value>
<Value name="16">
<Value>ChargeStatus</Value>
</Value>
<Value name="17">
<Value>ChargeCycles</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
