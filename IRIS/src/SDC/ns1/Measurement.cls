/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.Measurement Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "Measurement";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property MeasurementUnit As SDC.ns1.CodedValue(XMLNAME = "MeasurementUnit") [ Required ];

Property MeasuredValue As %Numeric(XMLNAME = "MeasuredValue", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Storage Default
{
<Data name="MeasurementState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>MeasurementUnit</Value>
</Value>
<Value name="3">
<Value>MeasuredValue</Value>
</Value>
</Data>
<State>MeasurementState</State>
<StreamLocation>^SDC.ns1.MeasurementS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
