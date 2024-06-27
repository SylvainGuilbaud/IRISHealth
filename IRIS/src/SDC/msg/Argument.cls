/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.Argument Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "Argument";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property ArgValue As %String(MAXLEN = "", XMLNAME = "ArgValue") [ Required ];

Storage Default
{
<Data name="ArgumentState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>ArgValue</Value>
</Value>
</Data>
<State>ArgumentState</State>
<StreamLocation>^SDC.msg.ArgumentS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
