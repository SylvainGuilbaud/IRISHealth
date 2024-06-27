/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.PhysicalConnectorInfo Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "PhysicalConnectorInfo";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Label As list Of SDC.ns1.LocalizedText(XMLNAME = "Label", XMLPROJECTION = "ELEMENT");

Property Number As %xsd.int(XMLNAME = "Number", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="PhysicalConnectorInfoState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Label</Value>
</Value>
<Value name="3">
<Value>Number</Value>
</Value>
</Data>
<State>PhysicalConnectorInfoState</State>
<StreamLocation>^SDC.ns1.PhysicalConnectorInfoS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
