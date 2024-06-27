/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.ProductionSpecification Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "ProductionSpecification";

Parameter XMLSEQUENCE = 1;

Property SpecType As SDC.ns1.CodedValue(XMLNAME = "SpecType") [ Required ];

Property ProductionSpec As %String(MAXLEN = "", XMLNAME = "ProductionSpec") [ Required ];

Property ComponentId As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "ComponentId");

Storage Default
{
<Data name="ProductionSpecificationState">
<Value name="1">
<Value>SpecType</Value>
</Value>
<Value name="2">
<Value>ProductionSpec</Value>
</Value>
<Value name="3">
<Value>ComponentId</Value>
</Value>
</Data>
<State>ProductionSpecificationState</State>
<StreamLocation>^SDC.ns1.ProductionS6684S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
