/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.ClinicalInfo Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "ClinicalInfo";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Type As SDC.ns1.CodedValue(XMLNAME = "Type");

Property Code As SDC.ns1.CodedValue(XMLNAME = "Code");

Property Criticality As %String(MAXLEN = "", VALUELIST = ",Lo,Hi", XMLNAME = "Criticality");

Property Description As list Of SDC.ns1.LocalizedText(XMLNAME = "Description", XMLPROJECTION = "ELEMENT");

Property RelatedMeasurement As list Of SDC.ns1.RelatedMeasurement(XMLNAME = "RelatedMeasurement", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="ClinicalInfoState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Type</Value>
</Value>
<Value name="3">
<Value>Code</Value>
</Value>
<Value name="4">
<Value>Criticality</Value>
</Value>
<Value name="5">
<Value>Description</Value>
</Value>
<Value name="6">
<Value>RelatedMeasurement</Value>
</Value>
</Data>
<State>ClinicalInfoState</State>
<StreamLocation>^SDC.ns1.ClinicalInfoS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
