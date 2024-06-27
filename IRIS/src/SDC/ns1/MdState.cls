/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.MdState Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.VersionCounter, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "MdState";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property State As list Of SDC.ns1.AbstractState(CLASSNAME = 1, XMLNAME = "State", XMLPROJECTION = "ELEMENT");

Property StateVersion As SDC.ns1.VersionCounter(XMLNAME = "StateVersion", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="MdStateState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>State</Value>
</Value>
<Value name="3">
<Value>StateVersion</Value>
</Value>
</Data>
<State>MdStateState</State>
<StreamLocation>^SDC.ns1.MdStateS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
