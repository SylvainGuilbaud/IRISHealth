Class SDC.Service.StateEventServiceBinding Extends %SOAP.WebService [ ProcedureBlock ]
{

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-20701-2018";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "StateEventServiceBinding";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.2;

/// This is the namespace used for types by the Service
Parameter TYPENAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

Method EpisodicAlertReport(Output Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output ReportPart As %ListOfObjects(ELEMENTTYPE="SDC.msg.ReportPart4",XMLPROJECTION="element",XMLNAME="ReportPart")) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/StateEventService/EpisodicAlertReport", SoapBindingStyle = document, SoapBodyUse = literal, SoapMessageName = EpisodicAlertReport, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

Method EpisodicComponentReport(Output Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output ReportPart As %ListOfObjects(ELEMENTTYPE="SDC.msg.ReportPart3",XMLPROJECTION="element",XMLNAME="ReportPart")) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/StateEventService/EpisodicComponentReport", SoapBindingStyle = document, SoapBodyUse = literal, SoapMessageName = EpisodicComponentReport, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

Method EpisodicMetricReport(Output Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output ReportPart As %ListOfObjects(ELEMENTTYPE="SDC.msg.ReportPart2",XMLPROJECTION="element",XMLNAME="ReportPart")) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/StateEventService/EpisodicMetricReport", SoapBindingStyle = document, SoapBodyUse = literal, SoapMessageName = EpisodicMetricReport, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

Method EpisodicOperationalStateReport(Output Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output ReportPart As %ListOfObjects(ELEMENTTYPE="SDC.msg.ReportPart5",XMLPROJECTION="element",XMLNAME="ReportPart")) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/StateEventService/EpisodicOperationalStateReport", SoapBindingStyle = document, SoapBodyUse = literal, SoapMessageName = EpisodicOperationalStateReport, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

Method PeriodicAlertReport(Output Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output ReportPart As %ListOfObjects(ELEMENTTYPE="SDC.msg.ReportPart4",XMLPROJECTION="element",XMLNAME="ReportPart")) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/StateEventService/PeriodicAlertReport", SoapBindingStyle = document, SoapBodyUse = literal, SoapMessageName = PeriodicAlertReport, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

Method PeriodicComponentReport(Output Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output ReportPart As %ListOfObjects(ELEMENTTYPE="SDC.msg.ReportPart3",XMLPROJECTION="element",XMLNAME="ReportPart")) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/StateEventService/PeriodicComponentReport", SoapBindingStyle = document, SoapBodyUse = literal, SoapMessageName = PeriodicComponentReport, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

Method PeriodicMetricReport(Output Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output ReportPart As %ListOfObjects(ELEMENTTYPE="SDC.msg.ReportPart2",XMLPROJECTION="element",XMLNAME="ReportPart")) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/StateEventService/PeriodicMetricReport", SoapBindingStyle = document, SoapBodyUse = literal, SoapMessageName = PeriodicMetricReport, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

Method PeriodicOperationalStateReport(Output Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output ReportPart As %ListOfObjects(ELEMENTTYPE="SDC.msg.ReportPart5",XMLPROJECTION="element",XMLNAME="ReportPart")) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/StateEventService/PeriodicOperationalStateReport", SoapBindingStyle = document, SoapBodyUse = literal, SoapMessageName = PeriodicOperationalStateReport, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

Method SystemErrorReport(Output Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output ReportPart As %ListOfObjects(ELEMENTTYPE="SDC.msg.ReportPart6",XMLPROJECTION="element",XMLNAME="ReportPart",REQUIRED=1)) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/StateEventService/SystemErrorReport", SoapBindingStyle = document, SoapBodyUse = literal, SoapMessageName = SystemErrorReport, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

}
