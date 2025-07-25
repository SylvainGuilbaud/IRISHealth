/// 
Class SDC.msg.GetStatesFromArchive Extends SDC.msg.AbstractGet [ CompileAfter = SDC.ns1.HandleRef, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter XMLINCLUDEINGROUP = 0;

Parameter XMLNAME = "GetStatesFromArchive";

Property StateRevisions As SDC.msg.VersionFrame(XMLNAME = "StateRevisions");

Property TimeFrame As SDC.msg.TimeFrame(XMLNAME = "TimeFrame");

Property Handle As list Of SDC.ns1.HandleRef(XMLNAME = "Handle", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="AbstractGetState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>StateRevisions</Value>
</Value>
<Value name="3">
<Value>TimeFrame</Value>
</Value>
<Value name="4">
<Value>Handle</Value>
</Value>
</Data>
<Type>%Storage.Serial</Type>
}

}
