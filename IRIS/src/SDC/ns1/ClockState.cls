/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.ClockState Extends SDC.ns1.AbstractDeviceComponentState [ CompileAfter = (SDC.ns1.TimeZone, SDC.ns1.Timestamp), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "ClockState";

Property ActiveSyncProtocol As SDC.ns1.CodedValue(XMLNAME = "ActiveSyncProtocol");

Property ReferenceSource As list Of %String(MAXLEN = "", XMLNAME = "ReferenceSource", XMLPROJECTION = "ELEMENT");

Property DateAndTime As SDC.ns1.Timestamp(XMLNAME = "DateAndTime", XMLPROJECTION = "ATTRIBUTE");

Property RemoteSync As %Boolean(XMLNAME = "RemoteSync", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property Accuracy As %Numeric(XMLNAME = "Accuracy", XMLPROJECTION = "ATTRIBUTE");

Property LastSet As SDC.ns1.Timestamp(XMLNAME = "LastSet", XMLPROJECTION = "ATTRIBUTE");

Property TimeZone As SDC.ns1.TimeZone(XMLNAME = "TimeZone", XMLPROJECTION = "ATTRIBUTE");

Property CriticalUse As %Boolean(XMLNAME = "CriticalUse", XMLPROJECTION = "ATTRIBUTE");

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
<Value>ActiveSyncProtocol</Value>
</Value>
<Value name="12">
<Value>ReferenceSource</Value>
</Value>
<Value name="13">
<Value>DateAndTime</Value>
</Value>
<Value name="14">
<Value>RemoteSync</Value>
</Value>
<Value name="15">
<Value>Accuracy</Value>
</Value>
<Value name="16">
<Value>LastSet</Value>
</Value>
<Value name="17">
<Value>TimeZone</Value>
</Value>
<Value name="18">
<Value>CriticalUse</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
