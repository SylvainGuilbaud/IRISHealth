Class IRISHealth.production Extends Ens.Production
{

ClassMethod OnStart(pTimeStarted As %String) As %Status
{
  do ##class(%File).CopyDir("/data/HL7/test","/data/HL7/in",1)
  do ##class(%File).CopyDir("/data/HL7/test","/data/HL7/validate",1)
  do ##class(Ens.Util.Statistics).EnableStatsForProduction()

	return $$$OK
}

XData ProductionDefinition
{
<Production Name="IRISHealth.production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description>This demo transforms HL7v2 SIU messages to Kafka</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="source HL7 SIU FILE" Category="HL7" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HL7 SIU router</Setting>
  </Item>
  <Item Name="HL7 SIU router" Category="HL7" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">IRISHealth.HL7router.SIU</Setting>
  </Item>
  <Item Name="source HL7 SIU TCP" Category="HL7" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">HL7 SIU router</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">ISC:IRISHL7</Setting>
  </Item>
  <Item Name="target HL7 SIU TCP" Category="HL7" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="source HL7 SIU HTTP" Category="HL7" ClassName="EnsLib.HL7.Service.HTTPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">HL7 SIU router</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">ISC:IRISHL7</Setting>
  </Item>
  <Item Name="target HL7 SIU HTTP" Category="HL7" ClassName="EnsLib.HL7.Operation.HTTPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Kafka router" Category="Kafka" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">IRISHealth.rules.Kafka</Setting>
  </Item>
  <Item Name="JDBC Gateway" Category="SQL" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Ens.ProductionMonitorService" Category="" ClassName="Ens.ProductionMonitorService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="target IRIS TrakCare SQL" Category="SQL,Kafka" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="target IRIS DxCare SQL" Category="SQL,Kafka" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="target IRIS Surg SQL" Category="SQL,Kafka" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="get gender" Category="transfo + traitements" ClassName="HTTP.operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="HTTPServer">api.genderize.io</Setting>
    <Setting Target="Adapter" Name="SSLConfig">API</Setting>
    <Setting Target="Adapter" Name="URL">/</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="validate" Category="HL7,transfo + traitements" ClassName="IRISHealth.process.validate" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="store gender" Category="SQL,Kafka" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="RequestClass">IRISHealth.msg.gender</Setting>
    <Setting Target="Host" Name="ResponseClass">IRISHealth.msg.iris</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="source HL7 SIU FILE validate" Category="HL7" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="TargetConfigNames">validate</Setting>
  </Item>
  <Item Name="Ens.Activity.Operation.Local" Category="" ClassName="Ens.Activity.Operation.Local" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="source HPRIM FILE" Category="" ClassName="HPRIM.EDI.E1238.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/data/HPRIM/in/</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hpr</Setting>
    <Setting Target="Adapter" Name="SemaphoreSpec">*.ok</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HPRIM router</Setting>
    <Setting Target="Host" Name="DocSchemaCategory">HPRIM2.2</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/data/HPRIM/archive</Setting>
    <Setting Target="Adapter" Name="WorkPath">/data/HPRIM/work</Setting>
  </Item>
  <Item Name="target HPRIM FILE" Category="" ClassName="HPRIM.EDI.E1238.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Filename">%f_%Q.hpr</Setting>
    <Setting Target="Adapter" Name="FilePath">/data/HPRIM/out</Setting>
    <Setting Target="Host" Name="FileOK">1</Setting>
    <Setting Target="Host" Name="SearchTableClass">EnsLib.EDI.E1238.SearchTable</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Host" Name="OKSpec">ok</Setting>
    <Setting Target="Host" Name="ASegmentsEnabled">1</Setting>
    <Setting Target="Host" Name="MaxSegmentSize">220</Setting>
  </Item>
  <Item Name="HPRIM router" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">IRISHealth.HPRIMrouter.rules</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
  </Item>
  <Item Name="target HPRIM FTP" Category="" ClassName="HPRIM.EDI.E1238.Operation.FTPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FTPServer">IRISHealth-demo-ftp</Setting>
    <Setting Target="Adapter" Name="Credentials">ftp</Setting>
    <Setting Target="Adapter" Name="FilePath">./ftp/out</Setting>
    <Setting Target="Adapter" Name="FTPPort"></Setting>
  </Item>
</Production>
}

}
