/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.LocationReference Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "LocationReference";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Identification As list Of SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "Identification", XMLPROJECTION = "ELEMENT") [ Required ];

Property LocationDetail As SDC.ns1.LocationDetail(XMLNAME = "LocationDetail");

Storage Default
{
<Data name="LocationReferenceState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Identification</Value>
</Value>
<Value name="3">
<Value>LocationDetail</Value>
</Value>
</Data>
<State>LocationReferenceState</State>
<StreamLocation>^SDC.ns1.LocationReferenceS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
