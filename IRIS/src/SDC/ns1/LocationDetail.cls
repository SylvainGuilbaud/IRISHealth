/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.LocationDetail Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "LocationDetail";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property PoC As %String(MAXLEN = "", XMLNAME = "PoC", XMLPROJECTION = "ATTRIBUTE");

Property Room As %String(MAXLEN = "", XMLNAME = "Room", XMLPROJECTION = "ATTRIBUTE");

Property Bed As %String(MAXLEN = "", XMLNAME = "Bed", XMLPROJECTION = "ATTRIBUTE");

Property Facility As %String(MAXLEN = "", XMLNAME = "Facility", XMLPROJECTION = "ATTRIBUTE");

Property Building As %String(MAXLEN = "", XMLNAME = "Building", XMLPROJECTION = "ATTRIBUTE");

Property Floor As %String(MAXLEN = "", XMLNAME = "Floor", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="LocationDetailState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>PoC</Value>
</Value>
<Value name="3">
<Value>Room</Value>
</Value>
<Value name="4">
<Value>Bed</Value>
</Value>
<Value name="5">
<Value>Facility</Value>
</Value>
<Value name="6">
<Value>Building</Value>
</Value>
<Value name="7">
<Value>Floor</Value>
</Value>
</Data>
<State>LocationDetailState</State>
<StreamLocation>^SDC.ns1.LocationDetailS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
