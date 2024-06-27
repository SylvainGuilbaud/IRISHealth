/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.AbstractReportPart Extends (%SerialObject, %XML.Adaptor) [ CompileAfter = SDC.ns1.HandleRef, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter VALIDIFNULL = 1;

Parameter XMLNAME = "AbstractReportPart";

Parameter XMLSEQUENCE = 1;

Property Extension As SDC.ns.ExtensionType(CLASSNAME = 1, REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/extension", XMLNAME = "Extension", XMLREF = 1);

Property SourceMds As SDC.ns1.HandleRef(XMLNAME = "SourceMds");

Storage Default
{
<Data name="AbstractReportPartState">
<Value name="1">
<Value>Extension</Value>
</Value>
<Value name="2">
<Value>SourceMds</Value>
</Value>
</Data>
<State>AbstractReportPartState</State>
<StreamLocation>^SDC.msg.AbstractReportPartS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
