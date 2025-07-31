ROUTINE %ZSTART [Type=INC]
    Set ^IRIS.Temp("Secrets",$System.Util.GetEnviron("api-clientid")) = $System.Util.GetEnviron("api-clientsecret")
    