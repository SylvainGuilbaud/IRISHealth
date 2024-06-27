/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.RelatedMeasurement Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.MeasurementValidity, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "RelatedMeasurement";

Parameter XMLSEQUENCE = 1;

Property Value As SDC.ns1.Measurement(XMLNAME = "Value") [ Required ];

Property ReferenceRange As list Of SDC.ns1.ReferenceRange(XMLNAME = "ReferenceRange", XMLPROJECTION = "ELEMENT");

Property Validity As SDC.ns1.MeasurementValidity(XMLNAME = "Validity", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="RelatedMeasurementState">
<Value name="1">
<Value>Value</Value>
</Value>
<Value name="2">
<Value>ReferenceRange</Value>
</Value>
<Value name="3">
<Value>Validity</Value>
</Value>
</Data>
<State>RelatedMeasurementState</State>
<StreamLocation>^SDC.ns1.RelatedMeasurementS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
