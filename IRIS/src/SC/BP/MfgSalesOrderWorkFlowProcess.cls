/// Process for sales orders related to manufacturing with a workflow included
Class SC.BP.MfgSalesOrderWorkFlowProcess Extends Ens.BusinessProcessBPL [ DependsOn = SC.Core.BP.IssueContext ]
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='SC.Core.BP.Message.IssueAnalysisRequest' response='Ens.Response' contextsuperclass='SC.Core.BP.IssueContext' height='2200' width='2000' >
<context>
<property name='action' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='taskId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='salesorder' type='SC.Data.SalesOrder' instantiate='0' />
</context>
<sequence xend='200' yend='1150' >
<sequence name='Initialize the analysis' xpos='200' ypos='250' xend='200' yend='550' >
<assign name="Initialize context with issue" property="context.issueId" value="request.issueId" action="set" xpos='200' ypos='250' />
<code name='initialize sales order' xpos='200' ypos='350' >
<![CDATA[ set context.salesorder =context.getImpactedObject()]]>
</code>
<assign name="set process name" property="context.analysis.processName" value="request.targetProcess" action="set" xpos='200' ypos='450' />
</sequence>
<sequence name='Impact analysis' xpos='200' ypos='350' xend='200' yend='650' >
<assign name="set severity" property="context.analysis.severity" value="2" action="set" xpos='200' ypos='250' />
<assign name="Set urgency" property="context.analysis.urgency" value="3" action="set" xpos='200' ypos='350' />
<assign name="Set impact analysis" property="context.analysis.impactAnalysis" value="&quot;Serious customer satisfaction concerns, and a penalty of $50K.&quot;" action="set" xpos='200' ypos='450' />
<assign name="Set root cause analysis" property="context.analysis.rootCauseAnalysis" value="&quot;Order expected to be late due to a delayed maintenance caused by a late shipment of a part needed. &quot;" action="set" xpos='200' ypos='550' />
</sequence>
<sequence name='Option A details' xpos='200' ypos='450' xend='200' yend='1250' >
<code name='Create Option A' xpos='200' ypos='250' >
<![CDATA[ do context.createNewScenario()]]>
</code>
<assign name="set option A name" property="context.newScenario.optionName" value="&quot;Option A&quot;" action="set" xpos='200' ypos='350' />
<assign name="Set option A number" property="context.newScenario.optionNumber" value="&quot;A&quot;" action="set" xpos='200' ypos='450' />
<assign name="Set option A description" property="context.newScenario.description" value="&quot;Move the sales order to Hamburg plant&quot;" action="set" xpos='200' ypos='550' />
<assign name="Add supporting data" property="context.newScenario.supportingData" value="&quot;Impact: The order will be fulfilled on time, with extra $1500 shipping cost. Extra work load on Hamburg plant will require an early maintenance window.&quot;" action="set" xpos='200' ypos='650' />
<assign name="Set cost impact" property="context.newScenario.costImpact" value="1500" action="set" xpos='200' ypos='750' />
<assign name="Set time impact" property="context.newScenario.timeImpact" value="36" action="set" xpos='200' ypos='850' />
<assign name="Set feasibility" property="context.newScenario.feasibility" value="1" action="set" xpos='200' ypos='950' />
<assign name="Set recommended" property="context.newScenario.recommended" value="1" action="set" xpos='200' ypos='1050' />
<code name='Add Option A to analysis' xpos='200' ypos='1150' >
<![CDATA[ do context.addScenarioToAnalysis()]]>
</code>
</sequence>
<sequence name='Option B details' xpos='200' ypos='550' xend='200' yend='1250' >
<code name='Create Option B' xpos='200' ypos='250' >
<![CDATA[ do context.createNewScenario()]]>
</code>
<assign name="set option B name" property="context.newScenario.optionName" value="&quot;Option B&quot;" action="set" xpos='200' ypos='350' />
<assign name="Set option B number" property="context.newScenario.optionNumber" value="&quot;A&quot;" action="set" xpos='200' ypos='450' />
<assign name="Set option B description" property="context.newScenario.description" value="&quot;Wait for the part, complete the maintenance, and use expedited shipping once done.&quot;" action="set" xpos='200' ypos='550' />
<assign name="Add supporting data" property="context.newScenario.supportingData" value="&quot;Impact: $2000 extra shipping cost. Order expected to be 2 days late.&quot;" action="set" xpos='200' ypos='650' />
<assign name="Set cost impact" property="context.newScenario.costImpact" value="500" action="set" xpos='200' ypos='750' />
<assign name="Set time impact" property="context.newScenario.timeImpact" value="0" action="set" xpos='200' ypos='850' />
<assign name="Set featsibility" property="context.newScenario.feasibility" value="1" action="set" xpos='200' ypos='950' />
<assign name="Set recommended" property="context.newScenario.recommended" value="0" action="set" xpos='200' ypos='1050' />
<code name='Add Option B to analysis' xpos='200' ypos='1150' >
<![CDATA[ do context.addScenarioToAnalysis()]]>
</code>
</sequence>
<sequence name='Option C details' xpos='200' ypos='650' xend='200' yend='1250' >
<code name='Create Option C' xpos='200' ypos='250' >
<![CDATA[ do context.createNewScenario()]]>
</code>
<assign name="set option C name" property="context.newScenario.optionName" value="&quot;Option C&quot;" action="set" xpos='200' ypos='350' />
<assign name="Set option C number" property="context.newScenario.optionNumber" value="&quot;C&quot;" action="set" xpos='200' ypos='450' />
<assign name="Set option C description" property="context.newScenario.description" value="&quot;Leverage spare parts in Munich plant and redirect current shipment to Munich.&quot;" action="set" xpos='200' ypos='550' />
<assign name="Add supporting data" property="context.newScenario.supportingData" value="&quot;Impact: Current sales order will be done on time, but this will put $250,000 revenue at risk at Munich plant due to the delayed maintenance.&quot;" action="set" xpos='200' ypos='650' />
<assign name="Set cost impact" property="context.newScenario.costImpact" value="12000" action="set" xpos='200' ypos='750' />
<assign name="Set time impact" property="context.newScenario.timeImpact" value="0" action="set" xpos='200' ypos='850' />
<assign name="Set featsibility" property="context.newScenario.feasibility" value="1" action="set" xpos='200' ypos='950' />
<assign name="Set recommended" property="context.newScenario.recommended" value="0" action="set" xpos='200' ypos='1050' />
<code name='Add Option C to analysis' xpos='200' ypos='1150' >
<![CDATA[ do context.addScenarioToAnalysis()]]>
</code>
</sequence>
<call name='Create workflow' target='Workflow Operation' async='1' xpos='200' ypos='750' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;A,B&quot;" action="set" />
<assign property="callrequest.%Message" value="&quot;A. Use expedite shipping; B. Offer free shipping&quot;" action="set" />
<assign property="callrequest.%Subject" value="&quot;User input required for issue &quot;_context.analysis.issueId" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="context.action" value="callresponse.%Action" action="set" />
<assign property="context.taskId" value="callresponse.%Id()" action="set" />
</response>
</call>
<code name='Save analysis to issue ' xpos='200' ypos='850' >
<![CDATA[ set context.analysis.workflowId = $ListGet(process.%MasterPendingResponses.GetAt(1),1)
 do context.saveWorkflowAnalysisToIssue()]]>
</code>
<sync name='On workflow response' calls='Create workflow' type='all' xpos='200' ypos='950' />
<trace name='Trace the workflow response' value='context.taskId' xpos='200' ypos='1050' />
</sequence>
</process>
}

}
