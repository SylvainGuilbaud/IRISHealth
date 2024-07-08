Class SC.BP.MfgDemoProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="SC.BP.MfgDemoProduction" LogGeneralTraceEvents="false">
  <Description>Production used for demo with Mfg UCT</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="IssueAnalysisService" Category="" ClassName="SC.Core.BP.Service.SingleIssueBS" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="LateShipmentProcess" Category="" ClassName="SC.BP.LateShipmentProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MfgOrderProcess" Category="" ClassName="SC.BP.MfgSalesOrderWorkFlowProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SC.Core.BP.Service.SingleIssueBS" Category="Order" ClassName="SC.Core.BP.Service.SingleIssueBS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Workflow Operation" Category="Order" ClassName="EnsLib.Background.Workflow.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="InitialShipmentProcess" Category="" ClassName="SC.BP.InitialShipmentProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="LatePartProcess" Category="" ClassName="SC.BP.LatePartProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="LateOrderDueToPartShortage" Category="Order" ClassName="SC.BP.LateOrderDueToPartShortage" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
