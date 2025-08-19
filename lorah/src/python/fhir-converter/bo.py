import os

import requests
from liquid import FileExtensionLoader
from fhir_converter.renderers import Hl7v2Renderer, make_environment, hl7v2_default_loader

from iop import BusinessOperation

from msg import FhirConverterMessage, FhirConverterResponse, FhirRequest, FhirResponse

class FhirConverterOperation(BusinessOperation):
    def on_init(self):
        if not hasattr(self, 'template_path'):
            self.template_path = '/irisdev/app/templates'

        # create a renderer for the input data type
        self.renderer = Hl7v2Renderer(
            env=make_environment(
                loader=FileExtensionLoader(search_path=self.template_path),
                additional_loaders=[hl7v2_default_loader],
            )
    )

    def on_fhir_converter_message(self, request: FhirConverterMessage):
        # render the input data
        output_data = self.renderer.render_fhir_string(request.root_template, request.input_data)
        # create a FhirConverterResponse object
        fcr = FhirConverterResponse(
            status=200,
            output_data=output_data,
            output_filename=request.input_filename.replace('.hl7', '.json')
        )
        return fcr

class FhirHttpOperation(BusinessOperation):

    def on_init(self):
        if not hasattr(self, 'url'):
            self.url = 'https://webgatewayfhir/fhir/r5'
        if not hasattr(self, 'credential'):
            self.credential = 'SuperUser'

        self.session = requests.Session()
        self.session.auth = self._get_credentials()

    def _get_credentials(self) -> tuple:
        if self.credential == 'SuperUser':
            return ('SuperUser', 'SYS')
        else:
            return ('', '')
        
    def on_fhir_request(self, msg: FhirRequest):
        uri = msg.url or self.url
        uri = uri.rstrip('/') + '/' + msg.resource
        response = self.session.request(
            method=msg.method,
            url=uri,
            data=msg.data,
            headers=msg.headers,
            timeout=10,
            verify=False
        )
        return FhirResponse(
            status_code=response.status_code,
            content=response.text,
            headers=response.headers,
            resource=msg.resource
        )