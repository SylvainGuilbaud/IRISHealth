/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.CalibrationDocumentation Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "CalibrationDocumentation";

Parameter XMLSEQUENCE = 1;

Property Documentation As list Of SDC.ns1.LocalizedText(XMLNAME = "Documentation", XMLPROJECTION = "ELEMENT");

Property CalibrationResult As list Of SDC.ns1.CalibrationResult(XMLNAME = "CalibrationResult", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="CalibrationDocumentationState">
<Value name="1">
<Value>Documentation</Value>
</Value>
<Value name="2">
<Value>CalibrationResult</Value>
</Value>
</Data>
<State>CalibrationDocumentationState</State>
<StreamLocation>^SDC.ns1.Calibration8654S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
