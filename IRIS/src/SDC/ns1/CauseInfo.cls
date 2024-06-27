/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.CauseInfo Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "CauseInfo";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property RemedyInfo As SDC.ns1.RemedyInfo(XMLNAME = "RemedyInfo");

Property Description As list Of SDC.ns1.LocalizedText(XMLNAME = "Description", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="CauseInfoState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>RemedyInfo</Value>
</Value>
<Value name="3">
<Value>Description</Value>
</Value>
</Data>
<State>CauseInfoState</State>
<StreamLocation>^SDC.ns1.CauseInfoS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
