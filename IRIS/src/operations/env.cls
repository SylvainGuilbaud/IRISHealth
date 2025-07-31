Class operations.env Extends Ens.BusinessOperation
{

Method env(pRequest As Ens.StringContainer, Output pResponse As Ens.StringContainer) As %Status
{
    set sc=$$$OK

    Try {
        set env = pRequest.StringValue
        set value = $system.Util.GetEnviron(env)
        set pResponse = ##class(Ens.StringContainer).%New()
        set pResponse.StringValue = value
        $$$LOGINFO("Environment: "_env _":"_value)
    }
    Catch ex {
        Set tSC=ex.AsStatus()
        $$$LOGERROR("ERROR:" _ $system.Status.GetErrorText(tSC))
        set sc = tSC
    }

	return sc
}

Method pyenv(pRequest As Ens.StringRequest, Output pResponse As Ens.StringContainer) As %Status
{

    set sc=$$$OK

    Try {

        set env = pRequest.StringValue
        // Use Python to get the environment variable
        set value = ##class(%SYS.Python).Import("os").getenv(env)
        // Call the Python method to get the environment variable
        #; set value = ..getEnv(env) ; Uncomment this line if you want to use the Python method directly

        set pResponse = ##class(Ens.StringContainer).%New()

        set pResponse.StringValue = value

        $$$LOGINFO("Environment: "_env _":"_value)

    }

    Catch ex {

        Set tSC=ex.AsStatus()

        $$$LOGERROR("ERROR:" _ $system.Status.GetErrorText(tSC))

        set sc = tSC

    }

	return sc
}

Method getEnv(env As %String) As %String [ Language = python ]
{
import os
value = os.getenv(env)
return value
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="Ens.StringContainer">
        <Method>env</Method>
    </MapItem>
    <MapItem MessageType="Ens.StringRequest">
        <Method>pyenv</Method>
    </MapItem>
</MapItems>
}

}
