Class monitor.REST Extends %CSP.REST
{

/// Enable CORS for the REST service
Parameter HandleCorsRequest = 1;

/// This method handles GET requests to the /metrics endpoint
ClassMethod Metrics() As %Status
{
    Try {
        // Set response headers properly
        Do %response.SetHeader("Content-Type", "text/plain; version=0.0.4; charset=utf-8")

        // Switch to %SYS namespace to collect system-level metrics
        New $Namespace Set $Namespace = "%SYS"
        Set ref = ##class(SYS.Stats.Dashboard).Sample()

        // Convert System Uptime to seconds
        Set uptimeSeconds = ..ConvertUptimeToSeconds(ref.SystemUpTime)

        // Write Prometheus-compatible metrics with proper Unix line endings
        Write "# HELP iris_global_references_per_sec Number of global references per second", $CHAR(10)
        Write "# TYPE iris_global_references_per_sec gauge", $CHAR(10)
        Write "iris_global_references_per_sec ", ref.GloRefsPerSec, $CHAR(10)

        Write "# HELP iris_license_high Peak number of licenses used", $CHAR(10)
        Write "# TYPE iris_license_high gauge", $CHAR(10)
        Write "iris_license_high ", ref.LicenseHigh, $CHAR(10)

        Write "# HELP iris_active_processes Number of active processes", $CHAR(10)
        Write "# TYPE iris_active_processes gauge", $CHAR(10)
        Write "iris_active_processes ", ref.Processes, $CHAR(10)

        Write "# HELP iris_system_uptime System uptime in seconds", $CHAR(10)
        Write "# TYPE iris_system_uptime gauge", $CHAR(10)
        Write "iris_system_uptime ", uptimeSeconds, $CHAR(10)

        Write "# HELP iris_application_errors Number of application errors", $CHAR(10)
        Write "# TYPE iris_application_errors counter", $CHAR(10)
        Write "iris_application_errors ", ref.ApplicationErrors, $CHAR(10)

        Write "# RANDOM NUMBER", $CHAR(10)
        Write "# TYPE random_number counter", $CHAR(10)
        Write "random_number ", $RANDOM(10), $CHAR(10)

        Write "# SFTP ERRORS", $CHAR(10)
        Write "# TYPE random_number_sftp counter", $CHAR(10)
        Write "random_number_sftp ", $RANDOM(5)+1, $CHAR(10)

        Write "# HTTP NUMBER", $CHAR(10)
        Write "# TYPE random_number_http counter", $CHAR(10)
        Write "random_number_http ", $RANDOM(10)+1, $CHAR(10)

        Return $$$OK  ; Corrected success return
    } Catch ex {
        Do %response.SetHeader("Content-Type", "text/plain")
        Write "Internal Server Error", $CHAR(10)
        Do $System.Status.DisplayError(ex.AsStatus())  ; Log error details
        Return $$$ERROR($$$GeneralError, "Internal Server Error")  ; Proper error return
    }
}

/// Convert uptime string (e.g., "4d 18h 25m") to seconds
ClassMethod ConvertUptimeToSeconds(uptime As %String) As %Integer
{
    Set totalSeconds = 0
    If uptime["d" {
        Set days = +$Piece(uptime, "d", 1)
        Set uptime = $Piece(uptime, "d", 2, *)
        Set totalSeconds = totalSeconds + (days * 86400)
    }
    If uptime["h" {
        Set hours = +$Piece(uptime, "h", 1)
        Set uptime = $Piece(uptime, "h", 2, *)
        Set totalSeconds = totalSeconds + (hours * 3600)
    }
    If uptime["m" {
        Set minutes = +$Piece(uptime, "m", 1)
        Set totalSeconds = totalSeconds + (minutes * 60)
    }
    Quit totalSeconds
}

/// Configure web methods to handle requests
XData UrlMap
{
<Routes>
    <Route Url="/metrics" Method="GET" Call="Metrics"/>
</Routes>
}

}
