# InterSystems IRIS for Health

## start/stop 

* [start.sh](./start.sh) - spins up all containers via docker-compose and 
    invokes iris/configure.sh in the iris containers
* [stop.sh](./stop.sh) - removes all containers

## configure.sh
* [iris/configure.sh](./iris/configure.sh) - configures the IRIS container's CSPConfigName

## IRIS Management Portal

With this pod, the user can access each instance's Management Portal immediately without relying on the private web server. If running on your local machine, use these URLs:
* [IRIS Management Portal](http://localhost:28000/csp/sys/UtilHome.csp)

## IRIS APIs

With this pod, the user can access each instance's Management Portal immediately without relying on the private web server. If running on your local machine, use these URLs:
### API Atelier
* [IRIS API Atelier](http://localhost:28000/api/atelier/)
### API Management
* [IRIS API Management](http://localhost:28000/api/mgmnt/)
### IRIS Monitor Metrics
* [IRIS EM METRICS](http://localhost:28000/api/monitor/metrics)
### LICENSES
* [License Key EM](http://localhost:28000/csp/sys/mgr/%25CSP.UI.Portal.License.Key.zen)