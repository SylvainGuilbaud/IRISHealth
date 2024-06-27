/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.BaseDemographics Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "BaseDemographics";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Givenname As %String(MAXLEN = "", XMLNAME = "Givenname");

Property Middlename As list Of %String(MAXLEN = "", XMLNAME = "Middlename", XMLPROJECTION = "ELEMENT");

Property Familyname As %String(MAXLEN = "", XMLNAME = "Familyname");

Property Birthname As %String(MAXLEN = "", XMLNAME = "Birthname");

Property Title As %String(MAXLEN = "", XMLNAME = "Title");

Storage Default
{
<Data name="BaseDemographicsState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Givenname</Value>
</Value>
<Value name="3">
<Value>Middlename</Value>
</Value>
<Value name="4">
<Value>Familyname</Value>
</Value>
<Value name="5">
<Value>Birthname</Value>
</Value>
<Value name="6">
<Value>Title</Value>
</Value>
</Data>
<State>BaseDemographicsState</State>
<StreamLocation>^SDC.ns1.BaseDemographicsS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
