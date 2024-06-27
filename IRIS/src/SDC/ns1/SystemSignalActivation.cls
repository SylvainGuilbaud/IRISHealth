/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.SystemSignalActivation Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = (SDC.ns1.AlertActivation, SDC.ns1.AlertSignalManifestation), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "SystemSignalActivation";

Parameter XMLSEQUENCE = 1;

Property Manifestation As SDC.ns1.AlertSignalManifestation(XMLNAME = "Manifestation", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property State As SDC.ns1.AlertActivation(XMLNAME = "State", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Storage Default
{
<Data name="SystemSignalActivationState">
<Value name="1">
<Value>Manifestation</Value>
</Value>
<Value name="2">
<Value>State</Value>
</Value>
</Data>
<State>SystemSignalActivationState</State>
<StreamLocation>^SDC.ns1.SystemSignalB8BS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
