/// 
Class IRISHealth.process.validate Extends Ens.BusinessProcessBPL
{

Parameter SETTINGS = "forceWorkflow:Basic";

Property forceWorkflow As %Boolean [ InitialExpression = 0 ];

Storage Default
{
<Data name="validateDefaultData">
<Subscript>"validate"</Subscript>
<Value name="1">
<Value>forceWorkflow</Value>
</Value>
</Data>
<DefaultData>validateDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='EnsLib.HL7.Message' height='4000' width='2690' layout='manual' >
<context>
<property name='genderRequest' type='HTTP.msg.genderRequest' instantiate='0' />
<property name='genderResponse' type='HTTP.msg.genderResponse' instantiate='0' />
<property name='genderStored' type='IRISHealth.msg.iris' instantiate='0' />
<property name='HL7Msg' type='EnsLib.HL7.Message' instantiate='0' />
<property name='HTTPError' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='2500' />
</parameters>
</property>
<property name='workflowResponse' type='EnsLib.Workflow.TaskResponse' instantiate='0' />
</context>
<sequence xpos='200' ypos='150' xend='200' yend='2600' >
<assign name="init response" property="response" value="request" action="set" languageOverride="" xpos='200' ypos='250' />
<trace name='DocType' value='"DocType:"_request.DocType' xpos='200' ypos='350' />
<switch name='message type' xpos='200' ypos='450' xend='200' yend='700' >
<case condition='request.DocType["SIU"' name='"SIU"' >
<transform name='get FirstName from SIU' class='IRISHealth.transfo.getFirstNameSIU' source='request' target='context.genderRequest' xpos='335' ypos='600' />
</case>
<case condition='request.DocType["ADT"' name='ADT' >
<transform name='get FirstName from ADT' class='IRISHealth.transfo.getFirstNameADT' source='request' target='context.genderRequest' xpos='605' ypos='600' />
</case>
<case condition='request.DocType["ORM"' name='ORM' >
<transform name='get FirstName from ORM' class='IRISHealth.transfo.getFirstNameORM' source='request' target='context.genderRequest' xpos='875' ypos='600' />
</case>
<case condition='request.DocType["MDM"' name='MDM' >
<transform name='get FirstName from MDM' class='IRISHealth.transfo.getFirstNameMDM' source='request' target='context.genderRequest' xpos='1145' ypos='600' />
</case>
<default/>
</switch>
<trace name='first name' value='"firstName:"_context.genderRequest.firstName' xpos='200' ypos='800' />
<if name='NO FIRST NAME' condition='context.genderRequest.firstName=""' xpos='200' ypos='900' xend='200' yend='2500' >
<true>
<alert value='"NO FIRST NAME"' xpos='200' ypos='1050' />
</true>
<false>
<if name='workflow' condition='process.forceWorkflow' xpos='470' ypos='1050' xend='470' yend='1750' >
<annotation><![CDATA[contrôle si validation humaine est obligatoire]]></annotation>
<true>
<trace name='workflow' value='"forced workflow " _ process.forceWorkflow' xpos='470' ypos='1200' />
<call name='cellule identito-vigilance' target='cellule identito-vigilance' async='1' xpos='470' ypos='1300' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;male,female&quot;" action="set" languageOverride="" />
<assign property="callrequest.%Subject" value="&quot;valider genre de &quot;_context.genderRequest.firstName" action="set" languageOverride="" />
<assign property="callrequest.%UserName" value="&quot;Virgile&quot;" action="set" languageOverride="" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="context.workflowResponse" value="callresponse" action="set" languageOverride="" />
<assign property="context.genderResponse.gender" value="callresponse.%Action" action="set" languageOverride="" />
</response>
</call>
<sync name='cellule identito-vigilance' calls='cellule identito-vigilance' type='all' xpos='470' ypos='1400' />
</true>
<false>
<scope xpos='740' ypos='1200' xend='740' yend='1550' >
<call name='check gender' target='get gender' async='0' xpos='740' ypos='1300' >
<request type='HTTP.msg.genderRequest' >
<assign property="callrequest" value="context.genderRequest" action="set" languageOverride="" />
</request>
<response type='HTTP.msg.genderResponse' >
<assign property="context.genderResponse" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<faulthandlers>
<catchall xpos='740' ypos='1400' xend='200' yend='1100' >
<trace name='LastError' value='"%LastError "_$System.Status.GetErrorCodes(..%Context.%LastError)_" : "_$System.Status.GetOneStatusText(..%Context.%LastError)' xpos='200' ypos='250' />
<assign name="HTTP Error" property="context.HTTPError" value="$System.Status.GetOneStatusText(..%Context.%LastError)" action="set" languageOverride="" xpos='200' ypos='350' />
<switch name='HTTP Errors' xpos='200' ypos='450' xend='200' yend='1000' >
<case condition='context.HTTPError[429' name='HTTP/1.1 429 Too Many Requests' >
<trace name='Too Many Requests' value='"HTTP/1.1 429 Too Many Requests"' xpos='470' ypos='600' />
<call name='retrieve gender' target='retrieve gender' async='0' xpos='470' ypos='700' >
<request type='HTTP.msg.genderRequest' >
<assign property="callrequest" value="context.genderRequest" action="set" languageOverride="" />
</request>
<response type='Ens.StringResponse' >
<assign property="context.genderResponse.gender" value="callresponse.StringValue" action="set" languageOverride="" />
</response>
</call>
</case>
<case condition='context.HTTPError[404' name='HTTP/1.1 404 Not Found' >
<trace name='Not Found' value='"HTTP/1.1 404 Not Found"' xpos='740' ypos='600' />
<call name='cellule identito-vigilance' target='cellule identito-vigilance' async='1' xpos='740' ypos='700' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;male,female&quot;" action="set" languageOverride="" />
<assign property="callrequest.%Subject" value="&quot;valider genre de &quot;_context.genderRequest.firstName" action="set" languageOverride="" />
<assign property="callrequest.%UserName" value="&quot;Virgile&quot;" action="set" languageOverride="" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="context.workflowResponse" value="callresponse" action="set" languageOverride="" />
<assign property="context.genderResponse.gender" value="callresponse.%Action" action="set" languageOverride="" />
</response>
</call>
<sync name='cellule identito-vigilance' calls='cellule identito-vigilance' type='all' xpos='740' ypos='800' />
</case>
<case condition='context.HTTPError[505' name='HTTP/1.1 505 Not Supported' >
<trace name='Not Supported' value='"HTTP/1.1 404 Not Found"' xpos='1010' ypos='600' />
<call name='cellule identito-vigilance' target='cellule identito-vigilance' async='1' xpos='1010' ypos='700' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;male,female&quot;" action="set" languageOverride="" />
<assign property="callrequest.%Subject" value="&quot;valider genre de &quot;_context.genderRequest.firstName" action="set" languageOverride="" />
<assign property="callrequest.%UserName" value="&quot;Virgile&quot;" action="set" languageOverride="" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="context.workflowResponse" value="callresponse" action="set" languageOverride="" />
<assign property="context.genderResponse.gender" value="callresponse.%Action" action="set" languageOverride="" />
</response>
</call>
<sync name='cellule identito-vigilance' calls='cellule identito-vigilance' type='all' xpos='1010' ypos='800' />
</case>
<default name='default' >
<trace name='Other' value='context.HTTPError' xpos='200' ypos='600' />
</default>
</switch>
</catchall>
</faulthandlers>
</scope>
<trace name='gender' value='context.genderResponse.gender' xpos='740' ypos='1650' />
</false>
</if>
<call name='stock gender' target='store gender' async='0' xpos='470' ypos='1850' >
<request type='IRISHealth.msg.gender' >
<assign property="callrequest.firstname" value="context.genderRequest.firstName" action="set" languageOverride="" />
<assign property="callrequest.value" value="context.genderResponse.gender" action="set" languageOverride="" />
</request>
<response type='IRISHealth.msg.iris' >
<assign property="context.genderStored" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<switch name='message type' xpos='470' ypos='1950' xend='470' yend='2200' >
<case condition='request.DocType["SIU"' name='"SIU"' >
<transform name='set gender to SIU' class='IRISHealth.transfo.setGenderSIU' source='request' target='context.HL7Msg' xpos='605' ypos='2100' />
</case>
<case condition='request.DocType["ADT"' name='ADT' >
<transform name='set gender to ADT' class='IRISHealth.transfo.setGenderADT' source='request' target='context.HL7Msg' xpos='875' ypos='2100' />
</case>
<case condition='request.DocType["ORM"' name='ORM' >
<transform name='set gender to ORM' class='IRISHealth.transfo.setGenderORM' source='request' target='context.HL7Msg' xpos='1145' ypos='2100' />
</case>
<case condition='request.DocType["MDM"' name='MDM' >
<transform name='set gender to MDM' class='IRISHealth.transfo.setGenderMDM' source='request' target='context.HL7Msg' xpos='1415' ypos='2100' />
</case>
<default/>
</switch>
<assign name="response" property="response" value="context.HL7Msg" action="set" languageOverride="" xpos='470' ypos='2300' />
<call name='HL7 Router' target='HL7v2 router' async='1' xpos='470' ypos='2400' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="context.HL7Msg" action="set" languageOverride="" />
</request>
<response type='Ens.Response' />
</call>
</false>
</if>
</sequence>
</process>
}

}
