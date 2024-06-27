/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.Range Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter XMLNAME = "Range";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Lower As %Numeric(XMLNAME = "Lower", XMLPROJECTION = "ATTRIBUTE") [ SqlFieldName = _Lower ];

Property Upper As %Numeric(XMLNAME = "Upper", XMLPROJECTION = "ATTRIBUTE") [ SqlFieldName = _Upper ];

Property StepWidth As %Numeric(XMLNAME = "StepWidth", XMLPROJECTION = "ATTRIBUTE");

Property RelativeAccuracy As %Numeric(XMLNAME = "RelativeAccuracy", XMLPROJECTION = "ATTRIBUTE");

Property AbsoluteAccuracy As %Numeric(XMLNAME = "AbsoluteAccuracy", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="RangeState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Lower</Value>
</Value>
<Value name="3">
<Value>Upper</Value>
</Value>
<Value name="4">
<Value>StepWidth</Value>
</Value>
<Value name="5">
<Value>RelativeAccuracy</Value>
</Value>
<Value name="6">
<Value>AbsoluteAccuracy</Value>
</Value>
</Data>
<State>RangeState</State>
<StreamLocation>^SDC.ns1.RangeS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
