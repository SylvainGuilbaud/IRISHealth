/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.PerformedOrderDetail Extends SDC.ns1.OrderDetail [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLINCLUDEINGROUP = 0;

Parameter XMLNAME = "PerformedOrderDetail";

Property FillerOrderNumber As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "FillerOrderNumber");

Property ResultingClinicalInfo As list Of SDC.ns1.ClinicalInfo(XMLNAME = "ResultingClinicalInfo", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="OrderDetailState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Start</Value>
</Value>
<Value name="3">
<Value>End</Value>
</Value>
<Value name="4">
<Value>Performer</Value>
</Value>
<Value name="5">
<Value>Service</Value>
</Value>
<Value name="6">
<Value>ImagingProcedure</Value>
</Value>
<Value name="7">
<Value>FillerOrderNumber</Value>
</Value>
<Value name="8">
<Value>ResultingClinicalInfo</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
