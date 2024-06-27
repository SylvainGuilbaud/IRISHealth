/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.ApplyAnnotation Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "ApplyAnnotation";

Parameter XMLSEQUENCE = 1;

Property AnnotationIndex As %xsd.unsignedInt(XMLNAME = "AnnotationIndex", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Property SampleIndex As %xsd.unsignedInt(XMLNAME = "SampleIndex", XMLPROJECTION = "ATTRIBUTE") [ Required ];

Storage Default
{
<Data name="ApplyAnnotationState">
<Value name="1">
<Value>AnnotationIndex</Value>
</Value>
<Value name="2">
<Value>SampleIndex</Value>
</Value>
</Data>
<State>ApplyAnnotationState</State>
<StreamLocation>^SDC.ns1.ApplyAnnotationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
