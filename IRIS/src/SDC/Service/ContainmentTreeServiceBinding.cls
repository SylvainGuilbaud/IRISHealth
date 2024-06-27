Class SDC.Service.ContainmentTreeServiceBinding Extends %SOAP.WebService [ ProcedureBlock ]
{

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-20701-2018";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "ContainmentTreeServiceBinding";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.2;

/// This is the namespace used for types by the Service
Parameter TYPENAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

Method GetContainmentTree(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), HandleRef As %ListOfDataTypes(ELEMENTTYPE="SDC.ns1.HandleRef",XMLPROJECTION="element",XMLNAME="HandleRef"), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output ContainmentTree As SDC.ns1.ContainmentTree(REQUIRED=1)) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/ContainmentTreeService/GetContainmentTree", SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

Method GetDescriptor(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), HandleRef As %ListOfDataTypes(ELEMENTTYPE="SDC.ns1.HandleRef",XMLPROJECTION="element",XMLNAME="HandleRef"), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output Descriptor As %ListOfObjects(ELEMENTTYPE="SDC.ns1.AbstractDescriptor",XMLPROJECTION="element",CLASSNAME=1,XMLNAME="Descriptor")) [ Final, ProcedureBlock = 1, SoapAction = "http://standards.ieee.org/downloads/11073/11073-20701-2018/ContainmentTreeService/GetDescriptor", SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 // Web Service Method Implementation Goes Here.
}

}
