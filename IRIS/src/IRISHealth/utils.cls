Class IRISHealth.utils Extends %RegisteredObject
{

ClassMethod purge() As %Status [ Language = python ]
{
    import iris
    import requests
    from datetime import datetime
    now = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S.%f")
    Server = "host.docker.internal"
    Port = 52773
    Username = "_system"
    Password = "SYS"
    url = "http://" + Server + ":" + str(Port) + "/irisapp/fhir/r4/Patient/"

    for x in range(0,10000):
        print(x+1)
        url = "http://IRISHealth:52773/irisapp/fhir/r4/Patient/" + str(x) 
        resp = requests.delete(url, auth=(Username, Password))
        print("resp:" + resp.text)
        print("status:" + str(resp.status_code))
}

ClassMethod load(pInputDirectory As %String = "/IRIS/data/fhir/", pServiceType As %String = "FHIRServer", pServiceName As %String = "/irisapp/fhir/r4", pDisplayProgress As %Boolean = 1) As %Status
{
    Try {
        set sc = $$$OK
        set sc = ##class(HS.FHIRServer.Tools.DataLoader).SubmitResourceFiles(pInputDirectory, pServiceType, pServiceName, pDisplayProgress)
    }
    Catch ex {
        set tSC=ex.AsStatus()
    }
    return sc
}

/// Create SQL Gateway
ClassMethod createSQLGateway() As %Status
{
        Set sc = $$$OK
        merge ^%SYS("sql","ODBCCONNECTION") = ^SQLGateway
        Return sc
}

ClassMethod sendHL7v2(source As %String = "/data/HL7/test/*", target As %String = "/data/HL7/in", verbose As %Boolean = 1) As %Status
{
    Try {
        set sc = $$$OK
        set command="cp"
        set args($i(args))=source
        set args($i(args))=target
        set status=$zf(-100,"/SHELL /LOGCMD /STDOUT=""/tmp/sendHL7v2.log"" /STDERR=""/tmp/sendHL7v2.error""",command,.args)
        if status=0 {
            write:verbose "Files successfully copied into " _ target,!
        } else {
            write:verbose "ERROR while copying files from " _ source _ " to " _ target _ " : " _ status
        }
    }
    Catch ex {
        set sc=ex.AsStatus()
    }
    return sc
}

/// Description
ClassMethod send() As %Status
{
        Set tSC = $$$OK
        
        set settings = ..settings()
        zw settings

        set client = ##class(%External.Messaging.Client).CreateClient(settings, .tSC)
        #; zw tSC
        // if tSC is an error, handle error scenario 
        // 

        Set producerSettings = "{""key.serializer"":""org.apache.kafka.common.serialization.StringSerializer""}"
        Set tSC = client.UpdateProducerConfig(producerSettings)

        Set topic = "test-from-IRIS"
        set msg = ""
        for i=1:1:5 { set msg = msg_ $c(13,10)_i _ ":" _ ##class(%PopulateUtils).Mission()}
       
        w !,msg,!
        w !,"msg:",$l(msg),!
        Set value = msg, key = "OptionalTag"

        Set msg = ##class(%External.Messaging.KafkaMessage).%New()
        Set msg.topic = topic
        Set msg.value = value
        Set msg.key = key

        Set tSC = client.SendMessage(msg)
        zw tSC
        Return tSC
}

/// Description
ClassMethod settings() As %External.Messaging.Settings
{
        Set settings = ##class(%External.Messaging.KafkaSettings).%New()
        // Set settings.username = "amandasmith"
        // Set settings.password = "234sdsge"
        // Set settings.servers = "host.docker.internal:9092, 100.0.70.089:7070"
        Set settings.servers = "host.docker.internal:9092"
        Set settings.clientId = "testFromIRIS"
        // If Consumer, specify a consumer group
        Set settings.groupId = "G1"
        Set settings.securityprotocol="SASL_PLAINTEXT"
        Set settings.saslmechanism="PLAIN"
        // Set settings.truststorelocation="/etc/kafkatls/trustcerts.jks"
        // Set settings.truststorepassword="F00B&r!"
        Return settings
}

}
