/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.CalibrationInfo Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = (SDC.ns1.CalibrationState, SDC.ns1.CalibrationType, SDC.ns1.Timestamp), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "CalibrationInfo";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property CalibrationDocumentation As list Of SDC.ns1.CalibrationDocumentation(XMLNAME = "CalibrationDocumentation", XMLPROJECTION = "ELEMENT");

Property ComponentCalibrationState As SDC.ns1.CalibrationState(XMLNAME = "ComponentCalibrationState", XMLPROJECTION = "ATTRIBUTE");

Property Type As SDC.ns1.CalibrationType(XMLNAME = "Type", XMLPROJECTION = "ATTRIBUTE");

Property Time As SDC.ns1.Timestamp(XMLNAME = "Time", XMLPROJECTION = "ATTRIBUTE") [ SqlFieldName = _Time ];

Storage Default
{
<Data name="CalibrationInfoState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>CalibrationDocumentation</Value>
</Value>
<Value name="3">
<Value>ComponentCalibrationState</Value>
</Value>
<Value name="4">
<Value>Type</Value>
</Value>
<Value name="5">
<Value>Time</Value>
</Value>
</Data>
<State>CalibrationInfoState</State>
<StreamLocation>^SDC.ns1.CalibrationInfoS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
