/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.PersonReference Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "PersonReference";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Identification As list Of SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "Identification", XMLPROJECTION = "ELEMENT") [ Required ];

Property Name As SDC.ns1.BaseDemographics(CLASSNAME = 1, XMLNAME = "Name");

Storage Default
{
<Data name="PersonReferenceState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Identification</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
</Data>
<State>PersonReferenceState</State>
<StreamLocation>^SDC.ns1.PersonReferenceS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
