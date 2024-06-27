/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.ns1.ImagingProcedure Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/participant";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "ImagingProcedure";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property AccessionIdentifier As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "AccessionIdentifier") [ Required ];

Property RequestedProcedureId As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "RequestedProcedureId") [ Required ];

Property StudyInstanceUid As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "StudyInstanceUid") [ Required ];

Property ScheduledProcedureStepId As SDC.ns1.InstanceIdentifier(CLASSNAME = 1, XMLNAME = "ScheduledProcedureStepId") [ Required ];

Property Modality As SDC.ns1.CodedValue(XMLNAME = "Modality");

Property ProtocolCode As SDC.ns1.CodedValue(XMLNAME = "ProtocolCode");

Storage Default
{
<Data name="ImagingProcedureState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>AccessionIdentifier</Value>
</Value>
<Value name="3">
<Value>RequestedProcedureId</Value>
</Value>
<Value name="4">
<Value>StudyInstanceUid</Value>
</Value>
<Value name="5">
<Value>ScheduledProcedureStepId</Value>
</Value>
<Value name="6">
<Value>Modality</Value>
</Value>
<Value name="7">
<Value>ProtocolCode</Value>
</Value>
</Data>
<State>ImagingProcedureState</State>
<StreamLocation>^SDC.ns1.ImagingProcedureS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
