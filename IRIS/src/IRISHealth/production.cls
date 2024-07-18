Class IRISHealth.production Extends Ens.Production
{

ClassMethod OnStart(pTimeStarted As %String) As %Status
{
  #; do ##class(%File).CopyDir("/data/HL7/test","/data/HL7/in",1)
  #; do ##class(%File).CopyDir("/data/HL7/test","/data/HL7/validate",1)
  do ##class(Ens.Util.Statistics).EnableStatsForProduction()
  do ##class(Ens.Util.Statistics).EnableSAMForNamespace()
	return $$$OK
}

XData ProductionDefinition
{
<Production Name="IRISHealth.production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="source HL7 FILE" Category="HL7" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HL7v2 router</Setting>
  </Item>
  <Item Name="HL7v2 router" Category="HL7" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">IRISHealth.HL7router.rules</Setting>
  </Item>
  <Item Name="source HL7 TCP" Category="HL7" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">HL7v2 router</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">ISC:IRISHL7</Setting>
  </Item>
  <Item Name="target HL7 TCP" Category="HL7" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="source HL7 HTTP" Category="HL7" ClassName="EnsLib.HL7.Service.HTTPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">HL7v2 router</Setting>
    <Setting Target="Host" Name="LocalFacilityApplication">ISC:IRISHL7</Setting>
  </Item>
  <Item Name="target HL7 HTTP" Category="HL7" ClassName="EnsLib.HL7.Operation.HTTPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Kafka router" Category="Kafka" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
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
  <Item Name="validate" Category="HL7,transfo + traitements" ClassName="IRISHealth.process.validate" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="forceWorkflow">1</Setting>
  </Item>
  <Item Name="store gender" Category="SQL,transfo + traitements" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="RequestClass">IRISHealth.msg.gender</Setting>
    <Setting Target="Host" Name="ResponseClass">IRISHealth.msg.iris</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="source HL7 FILE validate" Category="HL7" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="TargetConfigNames">validate</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5.1,MDM_*=2.5,ORM_*=2.5</Setting>
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
    <Setting Target="Adapter" Name="FTPServer">IRISHealth-ftp</Setting>
    <Setting Target="Adapter" Name="Credentials">ftp</Setting>
    <Setting Target="Adapter" Name="FilePath">./ftp/out</Setting>
    <Setting Target="Adapter" Name="FTPPort"></Setting>
  </Item>
  <Item Name="cellule identito-vigilance" Category="" ClassName="EnsLib.Workflow.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AutoCreateRole">1</Setting>
  </Item>
  <Item Name="HL7v2toSDA" Category="" ClassName="IRISHealth.process.HL7v2toSDA" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">SDAtoFHIR</Setting>
  </Item>
  <Item Name="SDAtoFHIR" Category="" ClassName="HS.FHIR.DTL.Util.HC.SDA3.FHIR.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TraceOperations">*FULL*</Setting>
    <Setting Target="Host" Name="FHIREndpoint">/irisapp/fhir/r4</Setting>
    <Setting Target="Host" Name="FHIRMetadataSet">HL7v40 / FHIR R4 Core Specification</Setting>
    <Setting Target="Host" Name="TargetConfigName">HS.FHIRServer.Interop.Operation</Setting>
  </Item>
  <Item Name="HS.Util.Trace.Operations" Category="" ClassName="HS.Util.Trace.Operations" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.FHIRServer.Interop.Operation" Category="" ClassName="HS.FHIRServer.Interop.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.FHIRServer.Interop.Service" Category="" ClassName="HS.FHIRServer.Interop.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="de Résultats de Laboratoire" Category="Résultats de Laboratoire" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.3</Setting>
    <Setting Target="Host" Name="TargetConfigNames">LABO</Setting>
    <Setting Target="Adapter" Name="FilePath">/data/LabResult/in</Setting>
    <Setting Target="Adapter" Name="ArchivePath"></Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="LABO" Category="Résultats de Laboratoire" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">LabResult.rules.LABO</Setting>
  </Item>
  <Item Name="conversion PDF" Category="Résultats de Laboratoire" ClassName="LabResult.operation.conversion" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/data/LabResult/pdf</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Host" Name="PDFgenerator">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="from Lab TCP" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Port">9000</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3</Setting>
    <Setting Target="Host" Name="TargetConfigNames">LABO</Setting>
    <Setting Target="Host" Name="AddNackERR">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="to LAB TCP" Category="" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">127.0.0.1</Setting>
    <Setting Target="Adapter" Name="Port">9000</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="source Kafka Consumer TOPIC APT-FROM-DXPLANNING" Category="Kafka" ClassName="EnsLib.Kafka.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="source Kafka Consumer TOPIC APT-FROM-TRAKCARE" Category="Kafka" ClassName="EnsLib.Kafka.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="source Kafka Consumer TOPIC SURG" Category="Kafka" ClassName="EnsLib.Kafka.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="target Kafka Producer" Category="Kafka,HL7" ClassName="EnsLib.Kafka.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Alerte Email" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">IRISHealth.AlertRouter.Ens.AlertRoutingRule</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="planningastreintes" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">IRISHealth.rules.planningastreintes</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="Alertes Week-End" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Alertes de jour" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Alertes de nuit" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="source Portail Santé" Category="Demo" ClassName="FHIRDemo.Service.POSTService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.5.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HL7v2toSDA</Setting>
  </Item>
  <Item Name="HPRIMtoHL7v2" Category="" ClassName="IRISHealth.process.HPRIMtoHL7v2" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="source CSV FILE" Category="" ClassName="EnsLib.File.PassthroughService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">/data/CSV/archive/</Setting>
    <Setting Target="Adapter" Name="FilePath">/data/CSV/in/</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.csv</Setting>
    <Setting Target="Adapter" Name="WorkPath">/data/CSV/work/</Setting>
  </Item>
  <Item Name="api.genderize.io" Category="transfo + traitements" ClassName="HTTP.operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="HTTPServer">api.genderize.io</Setting>
    <Setting Target="Adapter" Name="SSLConfig">API</Setting>
    <Setting Target="Adapter" Name="URL">/</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="BloodPressurePlan" Category="" ClassName="Workflow.BP.BloodPressurePlan" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
    <Item Name="ManualBloodPressureRole" Category="" ClassName="EnsLib.Workflow.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AutoCreateRole">0</Setting>
  </Item>
  <Item Name="AutomaticBloodPressureRole" Category="" ClassName="EnsLib.Workflow.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AutoCreateRole">0</Setting>
  </Item>
</Production>
}

}
