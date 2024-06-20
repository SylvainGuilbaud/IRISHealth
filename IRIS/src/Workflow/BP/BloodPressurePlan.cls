/// 
Class Workflow.BP.BloodPressurePlan Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='Ens.Response' height='2450' width='2000' >
<context>
<property name='username' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='obxCount' type='%Integer' initialexpression='0' instantiate='0' />
<property name='obxIndex' type='%Integer' initialexpression='1' instantiate='0' />
<property name='dyastolic' type='%Integer' initialexpression='0' instantiate='0' />
<property name='systolic' type='%Integer' initialexpression='0' instantiate='0' />
<property name='automaticTask' type='EnsLib.Workflow.TaskResponse' instantiate='0' />
<property name='automaticResult' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='2200' >
<code name='Checking user' xpos='200' ypos='250' >
<![CDATA[ set context.username = request.GetValueAt("PID:3(1).1")
 do ##class(Workflow.Utils.Functions).UserExists(context.username,"ManualBloodPressureRole")
 do ##class(Workflow.Utils.Functions).UserExists(context.username,"AutomaticBloodPressureRole")]]>
</code>
<code name='Get automatic task' xpos='200' ypos='350' >
<![CDATA[  set context.automaticTask = ##class(Workflow.Utils.Functions).CheckTask(context.username,"AutomaticBloodPressureRole")]]>
</code>
<code name='Getting count of OBX' xpos='200' ypos='450' >
<![CDATA[ set context.obxCount = request.GetValueAt("OBX(*)")
 set context.obxIndex = 1]]>
</code>
<while name='Check OBX values' condition='context.obxCount &gt;= context.obxIndex' xpos='200' ypos='550' xend='200' yend='950' >
<if name='Check systolic' condition='request.GetValueAt("OBX("_context.obxIndex_"):ObservationIdentifier.Identifier") = "163030003" ' xpos='200' ypos='250' xend='200' yend='750' >
<true>
<assign name="Assign systolic value" property="context.systolic" value="request.GetValueAt(&quot;OBX(&quot;_context.obxIndex_&quot;):ObservationValue(1)&quot;)" action="set" xpos='200' ypos='400' />
</true>
<false>
<if name='Check dyastolic' condition='request.GetValueAt("OBX("_context.obxIndex_"):ObservationIdentifier.Identifier") = "163031004" ' xpos='470' ypos='400' xend='470' yend='650' >
<true>
<assign name="Assign dyastolic value" property="context.dyastolic" value="request.GetValueAt(&quot;OBX(&quot;_context.obxIndex_&quot;):ObservationValue(1)&quot;)" action="set" xpos='605' ypos='550' />
</true>
</if>
</false>
</if>
<assign name="Add index" property="context.obxIndex" value="context.obxIndex + 1" action="set" xpos='200' ypos='850' />
</while>
<if name='Pending task?' condition='$ISOBJECT(context.automaticTask)' xpos='200' ypos='650' xend='200' yend='2000' >
<true>
<trace name='Pending task' value='"Pending task "_context.systolic_" "_context.dyastolic' xpos='200' ypos='800' />
<if name='Check pressure' condition='(context.systolic &gt; 140) || (context.dyastolic &gt; 90)' xpos='200' ypos='900' xend='200' yend='1150' >
<true>
<code name='Close warning task' xpos='470' ypos='1050' >
<![CDATA[ do context.automaticTask.CompleteTask("Warning")]]>
</code>
</true>
<false>
<code name='Close normal task' xpos='200' ypos='1050' >
<![CDATA[ do context.automaticTask.CompleteTask("FalseAlarm")]]>
</code>
</false>
</if>
</true>
<false>
<trace name='No pending task' value='"No pending task "_context.systolic_" "_context.dyastolic' xpos='740' ypos='800' />
<if name='Check pressure' condition='(context.systolic &gt; 140) || (context.dyastolic &gt; 90)' xpos='740' ypos='900' xend='740' yend='1900' >
<true>
<call name='Create manual task' target='ManualBloodPressureRole' async='1' xpos='875' ypos='1050' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;Accept,Call GP,Call Medical Center,Help&quot;" action="set" />
<assign property="callrequest.%Message" value="&quot;Attention! Your blood pressure (&quot;_context.systolic_&quot; - &quot;_context.dyastolic_&quot;) is over the limit 130 - 90&quot;" action="set" />
<assign property="callrequest.%UserName" value="context.username" action="set" />
<assign property="callrequest.%Subject" value="&quot;High blood pressure&quot;" action="set" />
<assign property="callrequest.%Priority" value="2" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' />
</call>
<call name='Create auto task' target='AutomaticBloodPressureRole' async='1' xpos='875' ypos='1150' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;OK&quot;" action="set" />
<assign property="callrequest.%Message" value="&quot;Please, take your blood pressure with the medical device, this task will be closed automatically&quot;" action="set" />
<assign property="callrequest.%UserName" value="context.username" action="set" />
<assign property="callrequest.%Subject" value="&quot;Waiting for blood pressure measures&quot;" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="context.automaticResult" value="callresponse.%Action" action="set" />
</response>
</call>
<sync name='Wait for tasks' calls='Create manual task,Create auto task' type='all' xpos='875' ypos='1250' />
<if name='Check if warning' condition='context.automaticResult = "Warning"' xpos='875' ypos='1350' xend='875' yend='1800' >
<true>
<call name='Warning task for doctor' target='ManualBloodPressureRole' async='1' xpos='1010' ypos='1500' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;Accept,Call&quot;" action="set" />
<assign property="callrequest.%Message" value="&quot;Attention! Your patient &quot;_context.username_&quot; has dangerous blood pressure levels!&quot;" action="set" />
<assign property="callrequest.%UserName" value="&quot;FakeDoctor&quot;" action="set" />
<assign property="callrequest.%Subject" value="&quot;High blood pressure&quot;" action="set" />
<assign property="callrequest.%Priority" value="1" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' />
</call>
<call name='Warning task for patient' target='ManualBloodPressureRole' async='1' xpos='1010' ypos='1600' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;Accept&quot;" action="set" />
<assign property="callrequest.%Message" value="&quot;Attention! Your blood pressure (&quot;_context.systolic_&quot; - &quot;_context.dyastolic_&quot;) are over the limit 130 - 90. Your doctor will contact you.&quot;" action="set" />
<assign property="callrequest.%UserName" value="context.username" action="set" />
<assign property="callrequest.%Subject" value="&quot;High blood pressure&quot;" action="set" />
<assign property="callrequest.%Priority" value="1" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' />
</call>
<sync name='Waiting for tasks' calls='Warning task for doctor,Warning task for patient' type='all' xpos='1010' ypos='1700' />
</true>
</if>
</true>
</if>
</false>
</if>
<trace name='Process finished' value='"Process finished"' xpos='200' ypos='2100' />
</sequence>
</process>
}

}
