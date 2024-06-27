Class SDC.SetServiceBinding Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-20701-2018";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "SetServiceBinding";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.2;

/// This is the namespace used for types by the Service
Parameter TYPENAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Method Activate(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), OperationHandleRef As SDC.ns1.HandleRef(REQUIRED=1), Argument As %ListOfObjects(ELEMENTTYPE="SDC.msg.Argument",XMLPROJECTION="element",XMLNAME="Argument"), Output InvocationInfo As SDC.msg.InvocationInfo(REQUIRED=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute")) [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Do (..WebMethod("Activate")).Invoke($this,"http://standards.ieee.org/downloads/11073/11073-20701-2018/SetService/Activate",.Extension,.OperationHandleRef,.Argument,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)
}

Method OperationInvokedReport(Output Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output ReportPart As %ListOfObjects(ELEMENTTYPE="SDC.msg.ReportPart1",XMLPROJECTION="element",XMLNAME="ReportPart",REQUIRED=1)) [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Do (..WebMethod("OperationInvokedReport")).Invoke($this,"http://standards.ieee.org/downloads/11073/11073-20701-2018/SetService/OperationInvokedReport",.Extension,.MdibVersion,.SequenceId,.InstanceId,.ReportPart)
}

Method SetAlertState(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), OperationHandleRef As SDC.ns1.HandleRef(REQUIRED=1), ProposedAlertState As SDC.ns1.AbstractAlertState(CLASSNAME=1,REQUIRED=1), Output InvocationInfo As SDC.msg.InvocationInfo(REQUIRED=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute")) [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Do (..WebMethod("SetAlertState")).Invoke($this,"http://standards.ieee.org/downloads/11073/11073-20701-2018/SetService/SetAlertState",.Extension,.OperationHandleRef,.ProposedAlertState,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)
}

Method SetComponentState(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), OperationHandleRef As SDC.ns1.HandleRef(REQUIRED=1), ProposedComponentState As %ListOfObjects(ELEMENTTYPE="SDC.ns1.AbstractDeviceComponentState",XMLPROJECTION="element",CLASSNAME=1,XMLNAME="ProposedComponentState",REQUIRED=1), Output InvocationInfo As SDC.msg.InvocationInfo(REQUIRED=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute")) [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Do (..WebMethod("SetComponentState")).Invoke($this,"http://standards.ieee.org/downloads/11073/11073-20701-2018/SetService/SetComponentState",.Extension,.OperationHandleRef,.ProposedComponentState,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)
}

Method SetMetricState(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), OperationHandleRef As SDC.ns1.HandleRef(REQUIRED=1), ProposedMetricState As %ListOfObjects(ELEMENTTYPE="SDC.ns1.AbstractMetricState",XMLPROJECTION="element",CLASSNAME=1,XMLNAME="ProposedMetricState",REQUIRED=1), Output InvocationInfo As SDC.msg.InvocationInfo(REQUIRED=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute")) [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Do (..WebMethod("SetMetricState")).Invoke($this,"http://standards.ieee.org/downloads/11073/11073-20701-2018/SetService/SetMetricState",.Extension,.OperationHandleRef,.ProposedMetricState,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)
}

Method SetString(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), OperationHandleRef As SDC.ns1.HandleRef(REQUIRED=1), RequestedStringValue As %String(REQUIRED=1), Output InvocationInfo As SDC.msg.InvocationInfo(REQUIRED=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute")) [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Do (..WebMethod("SetString")).Invoke($this,"http://standards.ieee.org/downloads/11073/11073-20701-2018/SetService/SetString",.Extension,.OperationHandleRef,.RequestedStringValue,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)
}

Method SetValue(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), OperationHandleRef As SDC.ns1.HandleRef(REQUIRED=1), RequestedNumericValue As %Numeric(REQUIRED=1), Output InvocationInfo As SDC.msg.InvocationInfo(REQUIRED=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute")) [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Do (..WebMethod("SetValue")).Invoke($this,"http://standards.ieee.org/downloads/11073/11073-20701-2018/SetService/SetValue",.Extension,.OperationHandleRef,.RequestedNumericValue,.InvocationInfo,.MdibVersion,.SequenceId,.InstanceId)
}

}
