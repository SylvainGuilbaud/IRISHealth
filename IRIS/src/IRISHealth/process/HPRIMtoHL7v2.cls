/// 
Class IRISHealth.process.HPRIMtoHL7v2 Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='HPRIM.EDI.E1238.Document' response='EnsLib.HL7.Message' height='2000' width='2000' >
<sequence xend='200' yend='450' >
<transform name='HPRIM to HL7v2' class='IRISHealth.transfo.HPRIMtoHLVv2' source='request' target='response' xpos='200' ypos='250' />
<call name='HL7v2toSDA' target='HL7v2toSDA' async='1' xpos='200' ypos='350' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="response" action="set" languageOverride="" />
</request>
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
