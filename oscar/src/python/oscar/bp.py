import iris
from iop import BusinessProcess

from msg import FhirRequest

class FhirAnonymizerProcess(BusinessProcess):

    def on_init(self):
        if not hasattr(self, 'url'):
            self.url = 'http://anonymizer:52773/flask/'
        if not hasattr(self, 'path'):
            self.path = 'anonymize'
        if not hasattr(self, 'session_application'):
            self.session_application = '/oscar'

    def on_enslib_message(self, request: 'iris.HS.FHIRServer.Interop.Request'):
        # New request object
        request_oscar = request._ConstructClone(1)

        if request.QuickStreamId is not None and request.QuickStreamId != '':
            # get the payload from the request
            payload = self._quick_stream_to_string(request.QuickStreamId)
            # create a FhirRequest object
            fhir_request = FhirRequest(
                url=self.url,
                resource= self.path,
                method='POST',
                data=payload,
                headers={'Accept': 'application/json', 'Content-Type': 'application/json'}
            )
            # send this message to the FhirHttpOperation
            response = self.send_request_sync("Python.FhirHttpOperation", fhir_request)
            # Create a new QuickStream object
            quick_stream = self._string_to_quick_stream(response.content)
            # New request object
            request_oscar = request._ConstructClone(1)
            # Add the QuickStream object to the request
            request_oscar.QuickStreamId = quick_stream.Id

        # set the session application name
        request_oscar.Request.SessionApplication = self.session_application

        return self.send_request_sync("HS.FHIRServer.Interop.Operation", request_oscar)


    def _quick_stream_to_string(self, quick_stream_id) -> str:
        quick_stream = iris.cls('HS.SDA3.QuickStream')._OpenId(quick_stream_id)
        json_payload = ''
        while quick_stream.AtEnd == 0:
            json_payload += quick_stream.Read()

        return json_payload
    
    def _string_to_quick_stream(self, json_string:str):
        quick_stream = iris.cls('HS.SDA3.QuickStream')._New()

        # write the json string to the payload
        n = 3000
        chunks = [json_string[i:i+n] for i in range(0, len(json_string), n)]
        for chunk in chunks:
            quick_stream.Write(chunk)

        quick_stream.Rewind()
        quick_stream._Save()

        return quick_stream
