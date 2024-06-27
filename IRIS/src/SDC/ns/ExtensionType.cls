/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns.ExtensionType Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "ExtensionType";

Parameter XMLSEQUENCE = 1;

Property any As list Of %XML.String(XMLNAME = "any", XMLPROJECTION = "ANY") [ SqlFieldName = _any ];

Storage Default
{
<Data name="ExtensionTypeState">
<Value name="1">
<Value>any</Value>
</Value>
</Data>
<State>ExtensionTypeState</State>
<StreamLocation>^SDC.ns.ExtensionTypeS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
