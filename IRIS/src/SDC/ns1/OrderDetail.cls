/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.OrderDetail Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "OrderDetail";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Start As %TimeStamp(XMLNAME = "Start");

Property End As %TimeStamp(XMLNAME = "End") [ SqlFieldName = _End ];

Property Performer As list Of SDC.ns1.PersonParticipation(XMLNAME = "Performer", XMLPROJECTION = "ELEMENT");

Property Service As list Of SDC.ns1.CodedValue(XMLNAME = "Service", XMLPROJECTION = "ELEMENT");

Property ImagingProcedure As list Of SDC.ns1.ImagingProcedure(XMLNAME = "ImagingProcedure", XMLPROJECTION = "ELEMENT");

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
</Data>
<State>OrderDetailState</State>
<StreamLocation>^SDC.ns1.OrderDetailS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
