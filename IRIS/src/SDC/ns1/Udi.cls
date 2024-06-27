/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.Udi Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "Udi";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property DeviceIdentifier As %String(MAXLEN = "", XMLNAME = "DeviceIdentifier") [ Required ];

Property HumanReadableForm As %String(MAXLEN = "", XMLNAME = "HumanReadableForm") [ Required ];

Property Issuer As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "Issuer") [ Required ];

Property Jurisdiction As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "Jurisdiction");

Storage Default
{
<Data name="UdiState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>DeviceIdentifier</Value>
</Value>
<Value name="3">
<Value>HumanReadableForm</Value>
</Value>
<Value name="4">
<Value>Issuer</Value>
</Value>
<Value name="5">
<Value>Jurisdiction</Value>
</Value>
</Data>
<State>UdiState</State>
<StreamLocation>^SDC.ns1.UdiS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
