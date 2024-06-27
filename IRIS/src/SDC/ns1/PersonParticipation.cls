/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.PersonParticipation Extends SDC.ns1.PersonReference [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "PersonParticipation";

Property Role As list Of SDC.ns1.CodedValue(XMLNAME = "Role", XMLPROJECTION = "ELEMENT") [ SqlFieldName = _Role ];

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
<Value name="4">
<Value>Role</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
