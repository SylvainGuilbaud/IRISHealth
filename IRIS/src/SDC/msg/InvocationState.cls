/// Created from: /IRIS/SDC/IEEE11073-20701-Services.wsdl
Class SDC.msg.InvocationState Extends %String [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter MAXLEN;

Parameter NAMESPACE = "http://standards.ieee.org/downloads/11073/11073-10207-2017/message";

Parameter VALUELIST = ",Wait,Start,Cnclld,CnclldMan,Fin,FinMod,Fail";

}
