Class monitor.size Extends %Persistent
{

Property database As %String [ Required ];

Property globalname As %String [ Required ];

Property sizeallocated As %Numeric [ InitialExpression = 0 ];

Property sizeused As %Numeric [ InitialExpression = 0 ];

Index GlobalNameIndex On (database, globalname) [ Unique ];

ClassMethod add(database, globalname, sizeallocated, sizeused) As %Status
{
    Set sc = $$$OK,id=0
    &sql(select id into :id from monitor.size where database = :database and globalname = :globalname)
    if ##class(monitor.size).%ExistsId(id) {
        set a = ##class(monitor.size).%OpenId(id)
    } else {
        set a = ##class(monitor.size).%New()
        set a.database = database
        set a.globalname = globalname 
    }   
     
    set a.sizeallocated = sizeallocated
    set a.sizeused = sizeused  

    set sc = a.%Save()
    if sc'=1 {write "Error saving record: " do $System.Status.DisplayError(sc) quit}
    Return sc
}

ClassMethod globalSize(minSizeMB As %Integer = 1, Directory As %String = "/volumes/IRIS/mgr/iristemp/", Mask As %String = "*", SystemGlobals As %Boolean = 1, FastFlag As %Integer = 2) As %Status
{
        Set sc = $$$OK
        set statement = ##class(%SQL.Statement).%New()
        set preparedStatus = statement.%PrepareClassQuery("%SYS.GlobalQuery","Size")
        if preparedStatus'=1 {write "%PrepareClassQuery failed:" do $System.Status.DisplayError(preparedStatus) quit}
        set System=""
        set rs = statement.%Execute(Directory,System,Mask,SystemGlobals,,FastFlag)
        if rs.%SQLCODE'=0 {write "%Execute failed:" do $System.Status.DisplayError(rs.%SQLCODE) quit}

        while rs.%Next() {
            if rs.%Get("Allocated MB")> minSizeMB {
                set sc = ..add(Directory, rs.%Get("Name"), rs.%Get("Allocated MB"), rs.%Get("Used MB"))
            }
        }

        set query = "SELECT database, globalname, sizeallocated, sizeused FROM monitor.size WHERE database = ? AND sizeallocated > ? ORDER BY database, sizeallocated DESC"
        set statement = ##class(%SQL.Statement).%New()
        set preparedStatus = statement.%Prepare(.query)
        if preparedStatus'=1 {write "%Prepare failed:" do $System.Status.DisplayError(preparedStatus) quit}

        set rs = statement.%Execute(Directory,minSizeMB)
        if rs.%SQLCODE'=0 {write "%Execute failed:" do $System.Status.DisplayError(rs.%SQLCODE) quit}       
        write "Database | Global Name | Size Allocated | Size Used ",!
        while rs.%Next() {
            write rs.%Get("database") _ " | " _ rs.%Get("globalname") _ " | " _ rs.%Get("sizeallocated") _ " MB (used:" _ rs.%Get("sizeused") _ "MB)",!
        }
    
        Return sc
}

Storage Default
{
<Data name="sizeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>database</Value>
</Value>
<Value name="3">
<Value>globalname</Value>
</Value>
<Value name="4">
<Value>sizeallocated</Value>
</Value>
<Value name="5">
<Value>sizeused</Value>
</Value>
</Data>
<DataLocation>^monitor.sizeD</DataLocation>
<DefaultData>sizeDefaultData</DefaultData>
<IdLocation>^monitor.sizeD</IdLocation>
<IndexLocation>^monitor.sizeI</IndexLocation>
<StreamLocation>^monitor.sizeS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
