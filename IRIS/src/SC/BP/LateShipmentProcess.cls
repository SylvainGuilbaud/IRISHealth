/// Late shipment process demo process
Class SC.BP.LateShipmentProcess Extends Ens.BusinessProcessBPL [ DependsOn = SC.Core.BP.IssueContext ]
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='SC.Core.BP.Message.IssueAnalysisRequest' response='Ens.Response' contextsuperclass='SC.Core.BP.IssueContext' height='2000' width='2000' >
<context>
<property name='supplyshipment' type='SC.Data.SupplyShipment' instantiate='0' />
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
</context>
<sequence xend='200' yend='550' >
<sequence name='Initialize the analysis' xpos='200' ypos='250' xend='200' yend='550' >
<assign name="set issue to context" property="context.issueId" value="request.issueId" action="set" xpos='200' ypos='250' />
<code name='Initialize the supply shipment' xpos='200' ypos='350' >
<![CDATA[  set context.supplyshipment =context.getImpactedObject()]]>
</code>
<assign name="set process name" property="context.analysis.processName" value="request.targetProcess" action="set" xpos='200' ypos='450' />
</sequence>
<sequence name='Impact analysis' xpos='200' ypos='350' xend='200' yend='650' >
<assign name="Set severity" property="context.analysis.severity" value="3" action="set" xpos='200' ypos='250' />
<assign name="Set urgency" property="context.analysis.urgency" value="3" action="set" xpos='200' ypos='350' />
<assign name="Set impact analysis" property="context.analysis.impactAnalysis" value="&quot;Since this is a custom with a single source supplier, there is no other option to get the part to the plant on time. Current inventory shows no extra spare part available. Due the delay of required part, some sales orders will be impacted. Issues for those sales orders have been auto-generated to track the impacts.&quot;" action="set" xpos='200' ypos='450' />
<assign name="Set root cause analysis" property="context.analysis.rootCauseAnalysis" value="&quot;This is caused by COVID local shutdown.&quot;" action="set" xpos='200' ypos='550' />
</sequence>
<code name='Save analysis to issue' xpos='200' ypos='450' >
<![CDATA[ do context.saveAnalysisToIssue()]]>
</code>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
