/// 
Class SDC.msg.GetStatesFromArchiveResponse Extends SDC.msg.AbstractGetResponse [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter XMLINCLUDEINGROUP = 0;

Parameter XMLNAME = "GetStatesFromArchiveResponse";

Property State As list Of SDC.ns1.AbstractState(CLASSNAME = 1, XMLNAME = "State", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="AbstractGetResponseState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>MdibVersion</Value>
</Value>
<Value name="3">
<Value>SequenceId</Value>
</Value>
<Value name="4">
<Value>InstanceId</Value>
</Value>
<Value name="5">
<Value>State</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
