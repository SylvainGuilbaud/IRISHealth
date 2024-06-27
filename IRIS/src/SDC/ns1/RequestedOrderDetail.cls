/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.RequestedOrderDetail Extends SDC.ns1.OrderDetail [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLINCLUDEINGROUP = 0;

Parameter XMLNAME = "RequestedOrderDetail";

Property ReferringPhysician As SDC.ns1.PersonReference(CLASSNAME = 1, XMLNAME = "ReferringPhysician");

Property RequestingPhysician As SDC.ns1.PersonReference(CLASSNAME = 1, XMLNAME = "RequestingPhysician");

Property PlacerOrderNumber As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "PlacerOrderNumber") [ Required ];

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
<Value>ReferringPhysician</Value>
</Value>
<Value name="8">
<Value>RequestingPhysician</Value>
</Value>
<Value name="9">
<Value>PlacerOrderNumber</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
