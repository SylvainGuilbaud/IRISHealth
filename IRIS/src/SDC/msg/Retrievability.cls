/// 
Class SDC.msg.Retrievability Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "Retrievability";

Parameter XMLSEQUENCE = 1;

Property By As list Of SDC.msg.RetrievabilityInfo(XMLNAME = "By", XMLPROJECTION = "ELEMENT") [ SqlFieldName = _By ];

Storage Default
{
<Data name="RetrievabilityState">
<Value name="1">
<Value>By</Value>
</Value>
</Data>
<State>RetrievabilityState</State>
<StreamLocation>^SDC.msg.RetrievabilityS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
