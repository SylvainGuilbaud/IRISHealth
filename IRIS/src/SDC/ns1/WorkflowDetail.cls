/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.WorkflowDetail Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "WorkflowDetail";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property Patient As SDC.ns1.PersonReference(CLASSNAME = 1, XMLNAME = "Patient") [ Required ];

Property AssignedLocation As SDC.ns1.LocationReference(XMLNAME = "AssignedLocation");

Property VisitNumber As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "VisitNumber");

Property DangerCode As list Of SDC.ns1.CodedValue(XMLNAME = "DangerCode", XMLPROJECTION = "ELEMENT");

Property RelevantClinicalInfo As list Of SDC.ns1.ClinicalInfo(XMLNAME = "RelevantClinicalInfo", XMLPROJECTION = "ELEMENT");

Property RequestedOrderDetail As SDC.ns1.RequestedOrderDetail(XMLNAME = "RequestedOrderDetail");

Property PerformedOrderDetail As SDC.ns1.PerformedOrderDetail(XMLNAME = "PerformedOrderDetail");

Storage Default
{
<Data name="WorkflowDetailState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>Patient</Value>
</Value>
<Value name="3">
<Value>AssignedLocation</Value>
</Value>
<Value name="4">
<Value>VisitNumber</Value>
</Value>
<Value name="5">
<Value>DangerCode</Value>
</Value>
<Value name="6">
<Value>RelevantClinicalInfo</Value>
</Value>
<Value name="7">
<Value>RequestedOrderDetail</Value>
</Value>
<Value name="8">
<Value>PerformedOrderDetail</Value>
</Value>
</Data>
<State>WorkflowDetailState</State>
<StreamLocation>^SDC.ns1.WorkflowDetailS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
