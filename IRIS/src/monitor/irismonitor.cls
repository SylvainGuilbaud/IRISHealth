Class monitor.irismonitor Extends %SYS.Monitor.SAM.Abstract
{

ClassMethod add() As %Status
{
  Try {
    set ns=$NAMESPACE
    zn "%SYS" 
    set status = ##class(SYS.Monitor.SAM.Config).AddApplicationClass(..%ClassName(1),ns)
  }
  Catch ex {
    Set status=ex.AsStatus()
  }

  zn ns

  return status
}

Parameter PRODUCT = "irismonitor";

/// Collect metrics from 
Method GetSensors() As %Status
{
    Do ..getDashboardWS(.dashboard)

    #; Do ..SetSensor("systemuptime",dashboard.SystemUpTime)
    #; Do ..SetSensor("lastbackup",dashboard.LastBackup)
    Do ..SetSensor("locktable",$SELECT(dashboard.LockTable="Normal":1,1:0))
    Do ..SetSensor("journalspace",$SELECT(dashboard.JournalSpace="Normal":1,1:0))
    Do ..SetSensor("journalstatus",$SELECT(dashboard.JournalStatus="Normal":1,1:0))
    Do ..SetSensor("ecpappserver",$SELECT(dashboard.ECPAppServer="OK":1,1:0))
    Do ..SetSensor("ecpdataserver",$SELECT(dashboard.ECPDataServer="OK":1,1:0))
    Do ..SetSensor("writedaemon",$SELECT(dashboard.WriteDaemon="Normal":1,1:0))
    Do ..SetSensor("licensecurrent",dashboard.LicenseCurrent)
    Do ..SetSensor("licensecurrentpct",dashboard.LicenseCurrentPct)
    Do ..SetSensor("licensehigh",dashboard.LicenseHigh)
    Do ..SetSensor("licensehighpct",dashboard.LicenseHighPct)
    Do ..SetSensor("licenselimit",dashboard.LicenseLimit)
    Do ..SetSensor("applicationerrors",dashboard.ApplicationErrors)

    Return $$$OK
}

ClassMethod getDashboardWS(Output dashboard)
{
    New $Namespace
    Set $Namespace = "%SYS"

    Do ##class(Config.Startup).Get(.Prop)
    Set webPort = Prop("WebServerPort")

    Set client = ##class(SYS.WSMon.Client).%New()
    Set client.Location = "http://localhost:"_webPort_"/csp/sys/SYS.WSMon.Service.cls"
    Set dashboard = client.GetDashboard()

    return $$$OK
}

}
