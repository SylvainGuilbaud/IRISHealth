/// Process for sales orders expected to be late due to part shortage 
Class SC.BP.LateOrderDueToPartShortage Extends Ens.BusinessProcessBPL [ DependsOn = SC.Core.BP.IssueContext ]
{

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
<assign name="Set urgency" property="context.analysis.urgency" value="2" action="set" xpos='200' ypos='350' />
<assign name="Set impact analysis" property="context.analysis.impactAnalysis" value="&quot;Serious customer satisfaction concerns, and a penalty of $50K.&quot;" action="set" xpos='200' ypos='450' />
<assign name="Set root cause analysis" property="context.analysis.rootCauseAnalysis" value="&quot;Order expected to be late due to low inventory and a late shipment of a required part&quot;" action="set" xpos='200' ypos='550' />
</sequence>
<sequence name='Option A details' xpos='200' ypos='450' xend='200' yend='1250' >
<code name='Create Option A' xpos='200' ypos='250' >
<![CDATA[ do context.createNewScenario()]]>
</code>
<assign name="set option A name" property="context.newScenario.optionName" value="&quot;Option A&quot;" action="set" xpos='200' ypos='350' />
<assign name="Set option A number" property="context.newScenario.optionNumber" value="&quot;A&quot;" action="set" xpos='200' ypos='450' />
<assign name="Set option A description" property="context.newScenario.description" value="&quot;Do nothing and wait for the parts&quot;" action="set" xpos='200' ypos='550' />
<assign name="Add supporting data" property="context.newScenario.supportingData" value="&quot;Impact: Cannot make the promised delivery time. Major customer satisfaction concern and risk of losing estimated $540,000 revenue from this customer&quot;" action="set" xpos='200' ypos='650' />
<assign name="Set cost impact" property="context.newScenario.costImpact" value="0" action="set" xpos='200' ypos='750' />
<assign name="Set time impact" property="context.newScenario.timeImpact" value="36" action="set" xpos='200' ypos='850' />
<assign name="Set feasibility" property="context.newScenario.feasibility" value="1" action="set" xpos='200' ypos='950' />
<assign name="Set recommended" property="context.newScenario.recommended" value="0" action="set" xpos='200' ypos='1050' />
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
<assign name="Set option B description" property="context.newScenario.description" value="&quot;Reallocate parts reserved for other orders&quot;" action="set" xpos='200' ypos='550' />
<assign name="Add supporting data" property="context.newScenario.supportingData" value="&quot;Impact: Order will be shipped on time, but this will put $385,000 revenue at risk due to the other impacted orders.&quot;" action="set" xpos='200' ypos='650' />
<assign name="Set cost impact" property="context.newScenario.costImpact" value="350000" action="set" xpos='200' ypos='750' />
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
<assign name="Set option C description" property="context.newScenario.description" value="&quot;Use alternate part with free upgrade&quot;" action="set" xpos='200' ypos='550' />
<assign name="Add supporting data" property="context.newScenario.supportingData" value="&quot;Impact: Since there is sufficient inventory for the alternate part, which is a upgraded version of the original part, the order can be made and shipped on time, with no impact on other orders. This option will cost $2,500 extra.&quot;" action="set" xpos='200' ypos='650' />
<assign name="Set cost impact" property="context.newScenario.costImpact" value="2500" action="set" xpos='200' ypos='750' />
<assign name="Set time impact" property="context.newScenario.timeImpact" value="0" action="set" xpos='200' ypos='850' />
<assign name="Set featsibility" property="context.newScenario.feasibility" value="1" action="set" xpos='200' ypos='950' />
<assign name="Set recommended" property="context.newScenario.recommended" value="1" action="set" xpos='200' ypos='1050' />
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

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
