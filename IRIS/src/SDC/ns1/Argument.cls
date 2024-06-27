/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.Argument Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "Argument";

Parameter XMLSEQUENCE = 1;

Property ArgName As SDC.ns1.CodedValue(XMLNAME = "ArgName") [ Required ];

Property Arg As %String(MAXLEN = "", XMLNAME = "Arg") [ Required ];

Storage Default
{
<Data name="ArgumentState">
<Value name="1">
<Value>ArgName</Value>
</Value>
<Value name="2">
<Value>Arg</Value>
</Value>
</Data>
<State>ArgumentState</State>
<StreamLocation>^SDC.ns1.ArgumentS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
