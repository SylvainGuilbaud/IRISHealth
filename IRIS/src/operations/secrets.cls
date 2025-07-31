Class operations.secrets Extends Ens.BusinessOperation
{

Method secret(pRequest As Ens.StringContainer, Output pResponse As Ens.StringContainer) As %Status
{
    set sc=$$$OK

    Try {
        set env = pRequest.StringValue
        set value = $Get(^IRIS.Temp("Secrets", env), "")
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

XData MessageMap
{
<MapItems>
    <MapItem MessageType="Ens.StringContainer">
        <Method>secret</Method>
    </MapItem>
</MapItems>
}

}
