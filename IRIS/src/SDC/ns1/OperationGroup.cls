/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.OperationGroup Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = (SDC.ns1.OperatingMode, SDC.ns1.OperationRef), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "OperationGroup";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Type As SDC.ns1.CodedValue(XMLNAME = "Type") [ Required ];

Property OperatingMode As SDC.ns1.OperatingMode(XMLNAME = "OperatingMode", XMLPROJECTION = "ATTRIBUTE");

Property Operations As SDC.ns1.OperationRef(XMLNAME = "Operations", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="OperationGroupState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Type</Value>
</Value>
<Value name="3">
<Value>OperatingMode</Value>
</Value>
<Value name="4">
<Value>Operations</Value>
</Value>
</Data>
<State>OperationGroupState</State>
<StreamLocation>^SDC.ns1.OperationGroupS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
