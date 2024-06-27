/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.MetaData Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "MetaData";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Udi As list Of SDC.ns1.Udi(XMLNAME = "Udi", XMLPROJECTION = "ELEMENT");

Property LotNumber As %String(MAXLEN = "", XMLNAME = "LotNumber");

Property Manufacturer As list Of SDC.ns1.LocalizedText(XMLNAME = "Manufacturer", XMLPROJECTION = "ELEMENT");

Property ManufactureDate As %TimeStamp(XMLNAME = "ManufactureDate");

Property ExpirationDate As %TimeStamp(XMLNAME = "ExpirationDate");

Property ModelName As list Of SDC.ns1.LocalizedText(XMLNAME = "ModelName", XMLPROJECTION = "ELEMENT");

Property ModelNumber As %String(MAXLEN = "", XMLNAME = "ModelNumber");

Property SerialNumber As list Of %String(MAXLEN = "", XMLNAME = "SerialNumber", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="MetaDataState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Udi</Value>
</Value>
<Value name="3">
<Value>LotNumber</Value>
</Value>
<Value name="4">
<Value>Manufacturer</Value>
</Value>
<Value name="5">
<Value>ManufactureDate</Value>
</Value>
<Value name="6">
<Value>ExpirationDate</Value>
</Value>
<Value name="7">
<Value>ModelName</Value>
</Value>
<Value name="8">
<Value>ModelNumber</Value>
</Value>
<Value name="9">
<Value>SerialNumber</Value>
</Value>
</Data>
<State>MetaDataState</State>
<StreamLocation>^SDC.ns1.MetaDataS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
