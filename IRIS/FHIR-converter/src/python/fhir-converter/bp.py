import os

from iop import BusinessProcess

from msg import FhirConverterMessage, FhirRequest

class FhirConverterProcess(BusinessProcess):
    def on_enslib_message(self, request: 'iris.EnsLib.HL7.Message'):
        fcm = FhirConverterMessage(
            input_filename=os.path.basename(request.Source),
            input_data=request.RawContent,
            input_data_type='Hl7v2',
            root_template=request.Name
        )
        self.on_fhir_converter_message(fcm)

    def on_fhir_converter_message(self, request: FhirConverterMessage):
        # force template
        request.root_template = 'ADT_CUSTOM'
        # send this message to the FhirConverterOperation
        response = self.send_request_sync("Python.FhirConverterOperation", request)
        response.output_filename = request.input_filename.replace('.hl7', '.json')

        # send this to lorah
        fhir_request = FhirRequest(
            url='http://localhost:52773/',
            resource='fhir/r4/',
            method='POST',
            data=response.output_data,
            headers={'Accept': 'application/json', 'Content-Type': 'application/json+fhir'}
        )
        self.send_request_sync("Python.FhirHttpOperation", fhir_request)

