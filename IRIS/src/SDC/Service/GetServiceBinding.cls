Class SDC.Service.GetServiceBinding Extends %SOAP.WebService [ ProcedureBlock ]
{

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-20701-2018";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "GetServiceBinding";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.2;

/// This is the namespace used for types by the Service
Parameter TYPENAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

Method GetMdDescription(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), HandleRef As %ListOfDataTypes(ELEMENTTYPE="SDC.ns1.HandleRef",XMLPROJECTION="element",XMLNAME="HandleRef"), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output MdDescription As SDC.ns1.MdDescription(REQUIRED=1)) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/GetService/GetMdDescription", SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

Method GetMdState(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), HandleRef As %ListOfDataTypes(ELEMENTTYPE="SDC.ns1.HandleRef",XMLPROJECTION="element",XMLNAME="HandleRef"), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output MdState As SDC.ns1.MdState(REQUIRED=1)) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/GetService/GetMdState", SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

Method GetMdib(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output Mdib As SDC.ns1.Mdib(REQUIRED=1)) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/GetService/GetMdib", SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

}
