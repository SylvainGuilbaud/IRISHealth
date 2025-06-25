/// Utility class for ADMIN functions
/// This class is used to demonstrate how to write a simple utility function
/// that can be called from other classes or routines.
Class adm.utils Extends %RegisteredObject
{

ClassMethod logObjectScript(msg As %String, severity As %Integer = 0) As %Status
{
        Set sc = $$$OK
        set sc = ##class(%SYS.System).WriteToConsoleLog("<<FROM ADM UTILS>> "_ msg,0,severity)
        
        Return sc
}

ClassMethod log(msg As %String, severity As %Integer = 0) As %Status [ Language = python ]
{
        import iris
        sc = iris._SYS.System.WriteToConsoleLog("<<FROM ADM UTILS>> " + msg,0,severity)
        if sc != 1:
            print("Error logging message: ", sc)
        return sc
}

}
