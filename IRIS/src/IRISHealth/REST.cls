Include common

Class IRISHealth.REST Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

Parameter BsName = "source Portail Santé";

Parameter CHARSET = "utf-8";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/version" Method="GET" Call="version"/>
<Route Url="/api/:classname" Method="GET" Call="readAll"/>
<Route Url="/api/:classname" Method="POST" Call="create"/>
<Route Url="/api/:classname/:id" Method="GET" Call="read"/>
<Route Url="/api/:classname/:id" Method="PUT" Call="update"/>
<Route Url="/api/:classname/:id" Method="DELETE" Call="delete"/>
<Route Url="/sendfile" Method="POST" Call="SendFileContent" Cors="true"/>
<Route Url="/fhir/r4/Patient" Method="POST" Call="FHIRPOST" Cors="true"/>
<Route Url="/fhir/r4/Patient/:id" Method="GET" Call="FHIRGETPATIENT" Cors="true"/>
<Route Url="/fhir/r4/Everything/:id" Method="GET" Call="FHIRGETEVERYTHING" Cors="true"/>

<Route Url="/fhir/r4/Patient/:id" Method="DELETE" Call="FHIRDELETE" Cors="true"/>
<Route Url="/fhir/r4/Patient/:id" Method="PUT" Call="FHIRPUT" Cors="true"/>

<Route Url="/fhir/r4/Observation/:id" Method="GET" Call="FHIROBSERVATION" Cors="true"/>

<Route Url="/fhir/r4/Bundle" Method="POST" Call="FHIRBUNDLE" Cors="true" />

<Route Url="/list/:classname" Method="GET" Call="list" Cors="true"/>
<Route Url="/_spec" Method="GET" Call="spec" />
</Routes>
}

/// Description
ClassMethod FHIRBUNDLE() As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}

        try{
	
        #dim request as %Net.HttpRequest
        set request = ##class(%Net.HttpRequest).%New()
        set request.Server = "IRISHealth"
        set request.ContentType = "application/fhir+json; charset=UTF-8"
        do request.SetHeader("Accept","*/*")
        set request.Port = 52773
        do request.EntityBody.CopyFrom(%request.Content)

	    set st = request.Post("/irisapp/fhir/r4/Bundle")
        if ($$$ISERR(st)) {
            throw ##class(%Exception.StatusException).CreateFromStatus(st)
        }
	    set json.Status = request.HttpResponse.StatusCode
        write json.%ToJSON()
      
	} catch exp{
		set sc = exp.AsStatus()
	}
    Return sc
}

/// Description
ClassMethod FHIRGETPATIENT(id As %String) As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
        try{
	
        #dim request as %Net.HttpRequest
        set request = ##class(%Net.HttpRequest).%New()
        set request.Server = "IRISHealth"
        set request.ContentType = "application/fhir+json; charset=UTF-8"
        do request.SetHeader("Accept","*/*")
        set request.Port = 52773

	    set st = request.Get("/irisapp/fhir/r4/Patient/" _ id)
        if ($$$ISERR(st)) {
            throw ##class(%Exception.StatusException).CreateFromStatus(st)
        }
	    set json = {}.%FromJSON(request.HttpResponse.Data)
        write json.%ToJSON()
      
	} catch exp{
		set sc = exp.AsStatus()
	}
    Return sc
}

ClassMethod FHIRGETEVERYTHING(id As %String) As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
        try{
	
        #dim request as %Net.HttpRequest
        set request = ##class(%Net.HttpRequest).%New()
        set request.Server = "IRISHealth"
        set request.ContentType = "application/fhir+json; charset=UTF-8"
        do request.SetHeader("Accept","*/*")
        set request.Port = 52773

	    set st = request.Get("/irisapp/fhir/r4/Patient/" _ id _ "/$everything")
        if ($$$ISERR(st)) {
            throw ##class(%Exception.StatusException).CreateFromStatus(st)
        }
	    set json = {}.%FromJSON(request.HttpResponse.Data)
        write json.%ToJSON()
      
	} catch exp{
		set sc = exp.AsStatus()
	}
    Return sc
}

ClassMethod FHIROBSERVATION(id As %String) As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
        try{
	
        #dim request as %Net.HttpRequest
        set request = ##class(%Net.HttpRequest).%New()
        set request.Server = "IRISHealth"
        set request.ContentType = "application/fhir+json; charset=UTF-8"
        do request.SetHeader("Accept","*/*")
        set request.Port = 52773
        /* GET [base]/Observation?patient=[patient_id] */
	    set st = request.Get("/irisapp/fhir/r4/Observation?patient=" _ id)
        if ($$$ISERR(st)) {
            throw ##class(%Exception.StatusException).CreateFromStatus(st)
        }
	    set json = {}.%FromJSON(request.HttpResponse.Data)
        write json.%ToJSON()
      
	} catch exp{
		set sc = exp.AsStatus()
	}
    Return sc
}

ClassMethod FHIRDELETE(id As %String) As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
        try{
	
        #dim request as %Net.HttpRequest
        set request = ##class(%Net.HttpRequest).%New()
        set request.Server = "IRISHealth"
        set request.ContentType = "application/fhir+json; charset=UTF-8"
        do request.SetHeader("Accept","*/*")
        set request.Port = 52773


        // DELETE [base]/$bulk-delete?_type=Observation,AllergyIntolerance&subject=Patient/[patient-id]
        /* set st = request.Delete("/irisapp/fhir/r4/Patient/" _ id _ "/$purge") */
        /* set st = request.Delete("/irisapp/fhir/r4/$bulk-delete?_type=Observation,AllergyIntolerance,Immunization,DiagnosticReport,Procedure&subject=Patient/" _ id) */
        /* set bundle = {}
        
        set bundle."resourceType" =  "Bundle"
        set bundle."type" =  "transaction"
        set bundle."entry" =  []

        for resourceType = "Observation","Encounter","Patient" {
            set resource = {}
            set resource."request" = {}
            set resource."request"."method" = "DELETE"
            set resource."request"."url" = resourceType _ "?subject=Patient/" _ (id)
            do bundle."entry".%Push(resource)
        }
        
        do request.EntityBody.Write(bundle.%ToJSON())
        set st = request.Post("/irisapp/fhir/r4/") */


        set json.delete=[]
        set url = "/irisapp/fhir/r4/Patient/" _ id _ "?_hardDelete=true"
        set st = request.Delete(url)
        set delete = {}
        set delete.url = url
        set delete.Status = request.HttpResponse.StatusCode
        set delete.date=$zdt($now(-120),3,,6)
        do json.delete.%Push(delete)
        for resourceType = "Observation","Encounter","Procedure","DiagnosticReport","Claim","ExplanationOfBenefit","Immunization","MedicationRequest","CarePlan" {
            set url = "/irisapp/fhir/r4/" _ resourceType _"?patient=" _ id
            set st = request.Delete(url)
             set delete = {}
            set delete.url = url
            set delete.Status = request.HttpResponse.StatusCode
            set delete.date=$zdt($now(-120),3,,6)
            do json.delete.%Push(delete)
        }

        set url = "/irisapp/fhir/r4/Patient/" _ id
        set st = request.Delete(url)
        set delete = {}
        set delete.url = url
        set delete.Status = request.HttpResponse.StatusCode
        set delete.date=$zdt($now(-120),3,,6)
        do json.delete.%Push(delete)

        /* write bundle.%ToJSON() */

        if ($$$ISERR(st)) {
            throw ##class(%Exception.StatusException).CreateFromStatus(st)
        }
	    set json.Status = request.HttpResponse.StatusCode
        write json.%ToJSON()
      
	} catch exp{
        
		set sc = exp.AsStatus()
        
	}
    Return sc
}

ClassMethod FHIRPUT(id As %String) As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}

        try{
	
        #dim request as %Net.HttpRequest
        set request = ##class(%Net.HttpRequest).%New()
        set request.Server = "IRISHealth"
        set request.ContentType = "application/fhir+json; charset=UTF-8"
        do request.SetHeader("Accept","*/*")
        set request.Port = 52773
        do request.EntityBody.CopyFrom(%request.Content)

	    set st = request.Put("/irisapp/fhir/r4/Patient/" _ id)
        if ($$$ISERR(st)) {
            throw ##class(%Exception.StatusException).CreateFromStatus(st)
        }
	    set json.Status = request.HttpResponse.StatusCode
        write json.%ToJSON()
      
	} catch exp{
		set sc = exp.AsStatus()
	}
    Return sc
}

ClassMethod FHIRPOST() As %Status
{
    Set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}

        try{
	
        #dim request as %Net.HttpRequest
        set request = ##class(%Net.HttpRequest).%New()
        set request.Server = "IRISHealth"
        set request.ContentType = "application/fhir+json; charset=UTF-8"
        do request.SetHeader("Accept","*/*")
        set request.Port = 52773
        do request.EntityBody.CopyFrom(%request.Content)

	    set st = request.Post("/irisapp/fhir/r4/Patient")
        if ($$$ISERR(st)) {
            throw ##class(%Exception.StatusException).CreateFromStatus(st)
        }
	    set json.Status = request.HttpResponse.StatusCode
        write json.%ToJSON()
      
	} catch exp{
		set sc = exp.AsStatus()
	}
    Return sc
}

ClassMethod FHIRGETPY(id As %String) As %Status [ Language = python ]
{
    import requests

    Username = "_system"
    Password = "SYS"

    url = "http://IRISHealth:52773/irisapp/fhir/r4/Patient/" + id
    resp = requests.get(url, auth=(Username, Password))
    print(resp.text)
}

ClassMethod FHIRDELETEPY(id As %String) As %Status [ Language = python ]
{

    import requests

    Username = "_system"
    Password = "SYS"

    url = "http://IRISHealth:52773/irisapp/fhir/r4/Patient/" + id
    resp = requests.delete(url, auth=(Username, Password))
    print(resp.text)
    #; print("status:" + str(resp.status_code))
}

ClassMethod list(classname As %String) As %Status
{
    set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPETEXT
    Try {
    if ##class(%Dictionary.ClassDefinition).%ExistsId(classname) {
        set class = ##class(%Dictionary.ClassDefinition).%OpenId(classname)

        set header = "ID;"
        for h = 1 : 1 : class.Properties.Count() {
            set propertyName = class.Properties.GetAt(h).Name 
            set header = header _ propertyName
            if h < class.Properties.Count() {
                    set header = header _ ";"
                }
        }
        write header,!
        set tableName = class.SqlTableName
        set:tableName="" tableName = classname
        set sql = "select * from " _ tableName
        set result = ##class(%SQL.Statement).%ExecDirect(,sql)
        if result.%SQLCODE = 0 {
            set i = 0
            while result.%Next() { 
                do $INCREMENT(i)
                set line = i _ ";"
                   
                for l = 1 : 1 : class.Properties.Count() {
                    set propertyName = class.Properties.GetAt(l).Name
                    if class.Properties.GetAt(l).Type = "%Date"  {
                        set line = line _ $zd(result.%Get(propertyName),4)
                    } else {
                        set line = line _ result.%Get(propertyName) 
                    }
                    if l < class.Properties.Count() {
                        set line = line _ ";"
                    }
                    
                }
                write line,!
                    
            }
                
        }
    }
    else {
        write classname _ " doesn't exist"
    }
    }
    Catch ex {
        Set sc=ex.AsStatus()
    }
    return sc
}

ClassMethod SendFileContent() As %Status
{
    set %response.ContentType="application/json"
    If '..GetJSONFromRequest(.obj) {
        Set %response.Status = ..#HTTP400BADREQUEST
        Set error = {"errormessage": "JSON not found"}
        Write error.%ToJSON()
        Quit $$$OK
    }
    /// TODO  ajouter une modification
    Set content = obj.content
    set status = $$$OK
    set tMsg = ##class(EnsLib.HL7.Message).ImportFromString(content)
    try {
        $$$ThrowOnError(##class(Ens.Director).CreateBusinessService(..#BsName,.tService))
        
        $$$ThrowOnError(tService.ProcessInput(tMsg,.output))
    } catch(ex) {
        set status = ex.AsStatus()
    }
    
    Set result={}
    do result.%Set("Status",$s($$$ISERR(status):$system.Status.GetOneErrorText(status),1:"OK"))
    set result.ts=($zdt($h,3))
    write result.%ToJSON()
    return $$$OK
}

ClassMethod GetJSONFromRequest(ByRef obj As %DynamicObject) As %Boolean
{
  Set ok = 1
	Try {
		Set obj = ##class(%DynamicObject).%FromJSON(%request.Content)
	} Catch ex {
		Set ok = 0
	}
	Quit ok
}

ClassMethod readAll(classname As %String) As %Status
{
    set sc = $$$OK
    #; while $Get(^WAIT,1){hang 2}  
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
    Try {
        if ##class(%Dictionary.ClassDefinition).%ExistsId(classname) {
            set class = ##class(%Dictionary.ClassDefinition).%OpenId(classname)
            set nomClasse = $piece(classname,".",*)
            set schema = $replace($piece(classname,"."_nomClasse),".","_")
            set tableName = class.SqlTableName
            set:tableName="" tableName = nomClasse
            set sql = "select ID from " _ schema _ "." _ tableName
            set result = ##class(%SQL.Statement).%ExecDirect(,sql)
            if result.%SQLCODE = 0 {
                set json = []
                while result.%Next() { 
                    set a = $CLASSMETHOD(classname,"%OpenId",result.%GetData(1))
                    if $ISOBJECT(a) {
                        set sc = a.%JSONExportToStream(.str)
                        do json.%Push({}.%FromJSON(str))
                    }
                }
            } else {
                set json.SQLCODE = (result.%SQLCODE) 
                set json.Message = (result.%Message) 
                do json.%ToJSON()
            }
        } else {
            set json.error = classname _ " doesn't exist"
            do json.%ToJSON()
        }
        do json.%ToJSON()
    }
    Catch ex {
        Set sc=ex.AsStatus()
    }
    return sc
}

ClassMethod create(classname) As %Status
{
    Try {
        set start = $zh 
        set sc = $$$OK
        set %response.ContentType = ..#CONTENTTYPEJSON
        set json = {} 
        set json.system = $SYSTEM
        set json.ts = $zdt($now(),3,,6)
        set json.classname = (classname)
        set payload = {}.%FromJSON(%request.Content) 
        set id ="" 
        
        if ##class(%Dictionary.ClassDefinition).%ExistsId(classname) {
            set a = $CLASSMETHOD(classname,"%New")
            set sc = a.%JSONImport(payload)
            if sc {
                set sc = a.%Save()
                if sc {
                    set id = a.%Id()
                }
            }
        } else {
            set sc = $SYSTEM.Status.Error(5001,classname _ " doesn't exist")
        }
        if sc {
            set msg = "create " _ id _ " in " _ classname _ " successful"
            $$$log($this _ " create","ok",msg)
        } else {
            set msg = "error while creating " _ id _ " in " _ classname _ " : " _ $system.Status.GetErrorText(sc)
            $$$log($this _ " create","error",msg)
        }
        set json.id = (id)
        set json.msg = (msg)
        set json.elapse = $zh - start 
        do json.%ToJSON() 
    }
    Catch ex {
        set sc = ex.AsStatus()
    }
    return sc
}

ClassMethod read(classname, id) As %Status
{
    Try {
        set start = $zh 
        set sc = $$$OK
        set %response.ContentType = ..#CONTENTTYPEJSON
        set json = {}
        if ##class(%Dictionary.ClassDefinition).%ExistsId(classname) {
            if $CLASSMETHOD(classname,"%ExistsId",id) {
                set a = $CLASSMETHOD(classname,"%OpenId",id)
                if $IsObject(a) {
                    set sc = a.%JSONExportToStream(.str)
                    set json = {}.%FromJSON(str)
                }
            } else {
                set sc = $SYSTEM.Status.Error(5001, id _ " doesn't exist in " _ classname)
            }
        } else {
            set sc = $SYSTEM.Status.Error(5001,classname _ " doesn't exist")
        }
        if sc {
            set msg = "read " _ id _ " in " _ classname _ " successful"
            $$$log($this _ " read","ok",msg)
        } else {
            set msg = "error while deleting " _ id _ " of " _ classname _ " : " _ $system.Status.GetErrorText(sc)
            $$$log($this _ " read","error",msg)
            set json.msg = (msg)
        }

        do json.%ToJSON() 
    }
    Catch ex {
        set sc = ex.AsStatus()
    }
    return sc
}

ClassMethod update(classname, id) As %Status
{
    Try {
        set start = $zh 
        set sc = $$$OK
        set %response.ContentType = ..#CONTENTTYPEJSON
        set json = {} 
        set json.system = $SYSTEM
        set json.ts = $zdt($now(),3,,6)
        set json.classname = (classname)
        set payload = {}.%FromJSON(%request.Content) 
        
        if ##class(%Dictionary.ClassDefinition).%ExistsId(classname) {
            if $CLASSMETHOD(classname,"%ExistsId",id) {
                set a = $CLASSMETHOD(classname,"%OpenId",id)
                set sc = a.%JSONImport(payload)
                if sc {
                    set sc = a.%Save()
                }
            } else {
                set sc = $SYSTEM.Status.Error(5001, id _ " doesn't exist in " _ classname)
            }
        } else {
            set sc = $SYSTEM.Status.Error(5001,classname _ " doesn't exist")
        }
        if sc {
            set msg = "update " _ id _ " in " _ classname _ " successful"
            $$$log($this _ " update","ok",msg)
        } else {
            set msg = "error while updating " _ id _ " of " _ classname _ " : " _ $system.Status.GetErrorText(sc)
            $$$log($this _ " update","error",msg)
        }
        set json.id = id
        set json.msg = (msg)
        set json.elapse = $zh - start 
        do json.%ToJSON() 
    }
    Catch ex {
        set sc = ex.AsStatus()
    }
    return sc
}

ClassMethod delete(classname, id) As %Status
{
    Try {
        set start = $zh 
        set sc = $$$OK
        set %response.ContentType = ..#CONTENTTYPEJSON
        set json = {} 
        set json.system = $SYSTEM
        set json.ts = $zdt($now(),3,,6)
        set json.classname = (classname)
        if ##class(%Dictionary.ClassDefinition).%ExistsId(classname) {
            if $CLASSMETHOD(classname,"%ExistsId",id) {
                set sc = $CLASSMETHOD(classname,"%DeleteId",id)
            } else {
                set sc = $SYSTEM.Status.Error(5001, id _ " doesn't exist in " _ classname)
            }
        } else {
            set sc = $SYSTEM.Status.Error(5001,classname _ " doesn't exist")
        }
        if sc {
            set msg = "delete " _ id _ " in " _ classname _ " successful"
            $$$log($this _ " delete","ok",msg)
        } else {
            set msg = "error while deleting " _ id _ " of " _ classname _ " : " _ $system.Status.GetErrorText(sc)
            $$$log($this _ " delete","error",msg)
        }
        set json.id = id
        set json.msg = (msg)
        set json.elapse = $zh - start 
        do json.%ToJSON() 
    }
    Catch ex {
        set sc = ex.AsStatus()
    }
    return sc
}

ClassMethod version() As %Status
{

    set sc = $$$OK
    set %response.ContentType = ..#CONTENTTYPEJSON
    set json = {}
    set json.context="formation-iris-embedded"
    set json.version = ($zv)
    set json.date = ($zdt($h,3))
    set json.system = ($System)
    set json.username = ($Username)
    set json.roles = ($Roles)
    set json.namespace = ($Namespace)
    set nls = ##class(%SYS.NLS.Locale).GetLanguage()
    set json.country = ($listget(nls,1))
    set json.lang = ($listget(nls,2))
    set json.JavaHomeDirectory = $SYSTEM.Util.JavaHomeDirectory()
    set json.JavaExe = $SYSTEM.Util.JavaExe()
    do json.%ToJSON()
    return sc
}

// ClassMethod spec() As %Status

// {

//  try {

// 	set sc=$$$OK

// 	set %response.ContentType=..#CONTENTTYPEJSON

//     set file = ##class(%File).%New("/data/swagger-crud.json")

//     do file.Open("RS")

//     while 'file.AtEnd{

//         w file.ReadLine()

//     }

// 	} catch e {

// 		throw e

// 	}

// 	return sc

// }

ClassMethod spec() As %Status
{
  Set tSC = ##class(%REST.API).GetWebRESTApplication($NAMESPACE, %request.Application, .swagger)
  Do swagger.info.%Remove("x-ISC_Namespace")
  Set swagger.basePath = "/crud"
  Set swagger.info.title = "InterSystems IRIS CRUD demo"
  Set swagger.info.version = "0.1"
  Set swagger.host = "localhost:28000"
  Return ..%ProcessResult($$$OK, swagger)
}

ClassMethod %ProcessResult(pStatus As %Status = {$$$OK}, pResult As %DynamicObject = "") As %Status [ Internal ]
{
  #dim %response As %CSP.Response
  SET tSC = $$$OK
  IF $$$ISERR(pStatus) {
    SET %response.Status = 500
    SET tSC = ..StatusToJSON(pStatus, .tJSON)
    IF $isobject(tJSON) {
      SET pResult = tJSON
    } ELSE {
      SET pResult = { "errors": [ { "error": "Unknown error parsing status code" } ] }
    }
  } 
  ELSEIF pStatus=1 {
    IF '$isobject(pResult){
      SET pResult = {
      }
    }
  }
  ELSE {
    SET %response.Status = pStatus
    SET error = $PIECE(pStatus, " ", 2, *)
    SET pResult = {
      "error": (error)
    }
  }
  
  IF pResult.%Extends("%Library.DynamicAbstractObject") {
    WRITE pResult.%ToJSON()
  }
  ELSEIF pResult.%Extends("%JSON.Adaptor") {
    DO pResult.%JSONExport()
  }
  ELSEIF pResult.%Extends("%Stream.Object") {
    DO pResult.OutputToDevice()
  }
  
  QUIT tSC
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

}
