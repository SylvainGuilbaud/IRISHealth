/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.ReferenceRange Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "ReferenceRange";

Parameter XMLSEQUENCE = 1;

Property Range As SDC.ns1.Range(XMLNAME = "Range") [ Required ];

Property Meaning As SDC.ns1.CodedValue(XMLNAME = "Meaning");

Storage Default
{
<Data name="ReferenceRangeState">
<Value name="1">
<Value>Range</Value>
</Value>
<Value name="2">
<Value>Meaning</Value>
</Value>
</Data>
<State>ReferenceRangeState</State>
<StreamLocation>^SDC.ns1.ReferenceRangeS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
