/// 
Class LORAH.rules.CSVRouter Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="LORAH.production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<constraint name="source" value="source CSV Patient"></constraint>
<when condition="1" comment="">
<send transform="LORAH.transform.Patient.CSVtoSDA,HS.FHIR.DTL.SDA3.vR4.Patient.Patient" target=",CSVRouter"></send>
</when>
</rule>
<rule name="" disabled="false">
<constraint name="source" value="CSVRouter"></constraint>
<when condition="1" comment="">
<send transform="" target=",SDAtoFHIR,SDAtoFHIRXML"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
