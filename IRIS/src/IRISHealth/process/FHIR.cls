/// 
Class IRISHealth.process.FHIR Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='HTTP.FHIR.request' response='HTTP.FHIR.response' height='2000' width='2000' >
<context>
<property name='FHIR' type='HTTP.FHIR.response' instantiate='0' />
</context>
<sequence xend='200' yend='450' >
<call name='FHIR Server' target='GET FHIR Resources' async='0' xpos='200' ypos='250' >
<request type='HTTP.FHIR.request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='HTTP.FHIR.response' >
<assign property="context.FHIR" value="callresponse" action="set" languageOverride="" />
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<trace name='FHIR' value='"JSON:"_context.FHIR.json' xpos='200' ypos='350' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
