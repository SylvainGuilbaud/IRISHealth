Class Workflow.WS.Service Extends %CSP.REST
{

Parameter HandleCorsRequest = 0;

Parameter CHARSET = "utf-8";

XData UrlMap [ XMLNamespace = "https://www.intersystems.com/urlmap" ]
{
<Routes>
	<Route Url="/getTasks" Method="GET" Call="GetTasks" />
    <Route Url="/saveTask" Method="POST" Call="SaveTask" />
</Routes>
}

ClassMethod OnHandleCorsRequest(url As %String) As %Status
{
	set url = %request.GetCgiEnv("HTTP_REFERER")
    set origin = $p(url,"/",1,3) // origin = "http(s)://origin.com:port"

    // here you can check specific origins
    // otherway, it will allow all origins (useful while developing only)

	do %response.SetHeader("Access-Control-Allow-Credentials","true")
	do %response.SetHeader("Access-Control-Allow-Methods","GET,POST,PUT,DELETE,OPTIONS")
	do %response.SetHeader("Access-Control-Allow-Origin",origin)
	do %response.SetHeader("Access-Control-Allow-Headers","Access-Control-Allow-Origin, Origin, X-Requested-With, Content-Type, Accept, Authorization, Cache-Control")
	quit $$$OK
}

ClassMethod GetTasks() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        
        Do ##class(%REST.Impl).%SetStatusCode("200")
        set sql = "SELECT %Actions, %Message, %Priority, %Subject, TaskStatus_TimeCreated, ID FROM EnsLib_Workflow.TaskResponse WHERE TaskStatus_AssignedTo = ? AND TaskStatus_IsComplete = 0"
        set statement = ##class(%SQL.Statement).%New(), statement.%ObjectSelectMode = 1
        set status = statement.%Prepare(sql)
        if ($$$ISOK(status)) {
            set resultSet = statement.%Execute($USERNAME)
            if (resultSet.%SQLCODE = 0) {
                set tasks = []
                while (resultSet.%Next() '= 0) {
                    set task = {"actions": "", "message": "", "priority": "", "subject": "", "creation": "", "id": ""}
                    set task.actions = resultSet.%GetData(1)
                    set task.message = resultSet.%GetData(2)
                    set task.priority = resultSet.%GetData(3)
                    set task.subject = resultSet.%GetData(4)
                    set task.creation = resultSet.%GetData(5)
                    set task.id = resultSet.%GetData(6)
                    do tasks.%Push(task)
                }                
            }
        }
        set result = {"username": ""}
        set result.username = $USERNAME        
        Do ##class(%REST.Impl).%WriteResponse(tasks)
        
    } Catch (ex) {
        Do ##class(%REST.Impl).%SetStatusCode("400")
        return ex.DisplayString()
    }

    Quit $$$OK
}

ClassMethod SaveTask() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        
        // Reading the body of the http call with the person data
        set dynamicBody = {}.%FromJSON(%request.Content)
        
        set task = ##class(EnsLib.Workflow.TaskResponse).%OpenId(dynamicBody.%Get("id"))
        set sc = task.CompleteTask(dynamicBody.action)

        if $$$ISOK(sc) {	        
            Do ##class(%REST.Impl).%SetStatusCode("200")
            Do ##class(%REST.Impl).%WriteResponse({"result": "success"})         
		}	
        
    } Catch (ex) {
        Do ##class(%REST.Impl).%SetStatusCode("400")
        Do ##class(%REST.Impl).%WriteResponse({"result": "error"})
    }

    Quit $$$OK
}

}
