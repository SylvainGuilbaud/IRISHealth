from bo import FhirConverterOperation

from msg import FhirConverterMessage, FhirConverterResponse

import os

class TestFhirConverterOperation:
    def test_on_init(self):
        fhir_converter_operation = FhirConverterOperation()
        fhir_converter_operation.on_init()
        assert fhir_converter_operation.fhir_converter_url == 'http://localhost:5001/$convert-data'
        assert fhir_converter_operation.session is not None

    def test_on_fhir_converter_message(self):
        fhir_converter_operation = FhirConverterOperation()
        fhir_converter_operation.on_init()

        with open(os.path.join(os.path.dirname(__file__), 'data', 'ADT_fr.hl7'), 'r', encoding='utf-8') as f:
            body = f.read()

        request = FhirConverterMessage(
            input_filename='input_filename',
            input_data=body,
            input_data_type='Hl7v2',
            root_template='ADT_A01'
        )
        response = fhir_converter_operation.on_fhir_converter_message(request)

