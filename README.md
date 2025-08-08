# InterSystems IRIS for Health
## for demonstration only

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

# Send TCP HL7 Messages
You can send TCP HL7 messages using the provided Python script `send_hl7_tcp.py`. 
This script establishes a TCP connection to the specified server and port, constructs an HL7 message, and sends it over the connection.

```python
cd ./code/python
python3 send_hl7_tcp.py 
```