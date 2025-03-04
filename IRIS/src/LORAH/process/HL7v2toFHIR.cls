/// 
Class LORAH.process.HL7v2toFHIR Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='Ens.StringContainer' height='2000' width='2000' >
<context>
<property name='SDA' type='HS.Message.XMLMessage' instantiate='0' />
</context>
<sequence xend='200' yend='458' >
<call name='HL7v2toSDA' target='HL7v2toSDA' async='1' xpos='589' ypos='214' >
<request type='request' />
<response type='Ens.Response' />
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
