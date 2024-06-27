/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.AbstractState Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = (SDC.ns1.HandleRef, SDC.ns1.ReferencedVersion, SDC.ns1.VersionCounter), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "AbstractState";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property StateVersion As SDC.ns1.VersionCounter(XMLNAME = "StateVersion", XMLPROJECTION = "ATTRIBUTE");

Property DescriptorHandle As SDC.ns1.HandleRef(XMLNAME = "DescriptorHandle", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property DescriptorVersion As SDC.ns1.ReferencedVersion(XMLNAME = "DescriptorVersion", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="AbstractStateState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>StateVersion</Value>
</Value>
<Value name="3">
<Value>DescriptorHandle</Value>
</Value>
<Value name="4">
<Value>DescriptorVersion</Value>
</Value>
</Data>
<State>AbstractStateState</State>
<StreamLocation>^SDC.ns1.AbstractStateS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
