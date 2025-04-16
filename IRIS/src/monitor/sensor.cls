Class monitor.sensor Extends %SYS.Monitor.SAM.Abstract
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
   set items = ##class(Ens.Config.Production).%OpenId("IRISHealth.production").Items
   for i=1:1:items.Count() {
      set configName = $zcvt($translate(items.GetAt(i).Name," -.àâéèê","___aaeee"),"L")
      set Labels("id")=configName
      set nb = ..nbMessages(items.GetAt(i).Name,24)
      if nb>0 {
        do ..SetSensorLabels("nb",nb,.Labels)
    }
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
    WHERE TargetConfigName = :configName
    and TimeCreated >= DATEADD('hour', -:nbHours, sysdate)
    )
    
    return nb
}

}
