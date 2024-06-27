/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.CalibrationResult Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "CalibrationResult";

Parameter XMLSEQUENCE = 1;

Property Code As SDC.ns1.CodedValue(XMLNAME = "Code") [ Required ];

Property Value As SDC.ns1.Measurement(XMLNAME = "Value") [ Required ];

Storage Default
{
<Data name="CalibrationResultState">
<Value name="1">
<Value>Code</Value>
</Value>
<Value name="2">
<Value>Value</Value>
</Value>
</Data>
<State>CalibrationResultState</State>
<StreamLocation>^SDC.ns1.CalibrationResultS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
