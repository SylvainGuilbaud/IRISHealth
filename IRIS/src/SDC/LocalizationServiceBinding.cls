Class SDC.LocalizationServiceBinding Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-20701-2018";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "LocalizationServiceBinding";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.2;

/// This is the namespace used for types by the Service
Parameter TYPENAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Method GetLocalizedText(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Ref As %ListOfDataTypes(ELEMENTTYPE="SDC.ns1.LocalizedTextRef",XMLPROJECTION="element",XMLNAME="Ref"), Version As SDC.ns1.ReferencedVersion, Lang As %ListOfDataTypes(ELEMENTTYPE="%String",XMLPROJECTION="element",XMLNAME="Lang"), TextWidth As %ListOfDataTypes(ELEMENTTYPE="SDC.ns1.LocalizedTextWidth",XMLPROJECTION="element",XMLNAME="TextWidth"), NumberOfLines As %ListOfDataTypes(ELEMENTTYPE="%Integer",XMLPROJECTION="element",XMLNAME="NumberOfLines"), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output Text As %ListOfObjects(ELEMENTTYPE="SDC.ns1.LocalizedText",XMLPROJECTION="element",XMLNAME="Text")) [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Do (..WebMethod("GetLocalizedText")).Invoke($this,"http://standards.ieee.org/downloads/11073/11073-20701-2018/LocalizationService/GetLocalizedText",.Extension,.Ref,.Version,.Lang,.TextWidth,.NumberOfLines,.MdibVersion,.SequenceId,.InstanceId,.Text)
}

Method GetSupportedLanguages(ByRef Extension As SDC.ns.ExtensionType(CLASSNAME=1,REFELEMENTQUALIFIED=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/extension",XMLREF=1), Output MdibVersion As SDC.ns1.VersionCounter(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output SequenceId As %xsd.anyURI(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute",REQUIRED=1), Output InstanceId As %xsd.unsignedLong(XMLREF=1,REFNAMESPACE="http://standards.ieee.org/downloads/11073/11073-10207-2017/participant",XMLPROJECTION="attribute"), Output Lang As %ListOfDataTypes(ELEMENTTYPE="%String",XMLPROJECTION="element",XMLNAME="Lang")) [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Do (..WebMethod("GetSupportedLanguages")).Invoke($this,"http://standards.ieee.org/downloads/11073/11073-20701-2018/LocalizationService/GetSupportedLanguages",.Extension,.MdibVersion,.SequenceId,.InstanceId,.Lang)
}

}
