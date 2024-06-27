/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.MetricQuality Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = (SDC.ns1.GenerationMode, SDC.ns1.MeasurementValidity, SDC.ns1.QualityIndicator), ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "MetricQuality";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Validity As SDC.ns1.MeasurementValidity(XMLNAME = "Validity", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property Mode As SDC.ns1.GenerationMode(XMLNAME = "Mode", XMLPROJECTION = "ATTRIBUTE");

Property Qi As SDC.ns1.QualityIndicator(XMLNAME = "Qi", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="MetricQualityState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Validity</Value>
</Value>
<Value name="3">
<Value>Mode</Value>
</Value>
<Value name="4">
<Value>Qi</Value>
</Value>
</Data>
<State>MetricQualityState</State>
<StreamLocation>^SDC.ns1.MetricQualityS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
