Class monitor.sensorTest Extends %SYS.Monitor.SAM.Abstract
{

Parameter PRODUCT = "messages_24h";

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

/// Collect metrics from the specified sensors
Method GetSensors() As %Status
{
   &sql(delete from monitor.nb)
   set items = ##class(Ens.Config.Production).%OpenId("IRISHealth.production").Items
   for i=1:1:items.Count() {
      set configName = $zcvt($translate(items.GetAt(i).Name," -.àâéèê","___aaeee"),"L")
      set name = items.GetAt(i).Name
      set nb = ..nbMessages(items.GetAt(i).Name,24)

      if nb>0 {
        &sql(INSERT INTO monitor.nb (label,nb) VALUES (:configName,:nb))
      }
    }   

    Set sql="select nb,label,ts from monitor.nb order by nb desc"
	Set rs=##class(%SQL.Statement).%ExecDirect(,sql)


	set ^sensors($INCREMENT(^sensors)) = $zdt($h,3)

    set item = 0
    if (rs.%SQLCODE = 0) {
		while rs.%Next() {
            set item = item + 1
            set x = item _"-"_rs.label
            &sql(select lpad(:x,100,' ') into :label)
            set Labels("id")=label_rs.label 
            Try {
                set ^sensors($INCREMENT(^sensors)) = $LISTBUILD(rs.nb,rs.label)
                do ..SetSensorLabels("nb",rs.nb,.Labels)
            }
            Catch ex {
                Set tSC=ex.AsStatus()
                do ##class(%SYS.System).WriteToConsoleLog($system.Status.GetErrorText(tSC))
                set ^sensorErrors($INCREMENT(^sensorErrors)) = $system.Status.GetErrorText(tSC)
            }
		}
    }
	else {
		    set ^sensorErrors($INCREMENT(^sensorErrors)) = rs.%SQLCODE
    }
   return $$$OK
}

/// Description
ClassMethod nbMessages(configName As %String = "HL7v2 messages erreurs", nbHours As %Integer = 24) As %Integer
{
    set nb = 0
    &sql(
    SELECT count(*) 
    INTO :nb
    FROM Ens.MessageHeader  
    WHERE (TargetConfigName = :configName or SourceConfigName = :configName)
    and TimeCreated >= DATEADD('hour', -:nbHours, sysdate)
    )
    
    return nb
}

}
