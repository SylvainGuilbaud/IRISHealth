Class IRISHealth.security.check Extends Ens.Rule.FunctionSet
{

/// Description
ClassMethod getSecurity(data As %String) As %String
{

        set hash = data _ ##class(%SYSTEM.Util).CreateGUID()
        Return hash
}

}
