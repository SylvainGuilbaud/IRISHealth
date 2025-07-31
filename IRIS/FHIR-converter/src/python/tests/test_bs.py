from bs import Hl7v2FileService

import os

from unittest.mock import MagicMock

class TestHl7v2FileService:
    def test_on_init(self):
        hl7v2_file_service = Hl7v2FileService()
        hl7v2_file_service.on_init()
        assert hl7v2_file_service.input_path == '/irisdev/app/data/input'
        assert hl7v2_file_service.output_path == '/irisdev/app/data/output'

    def test_get_adapter_type(self):
        assert Hl7v2FileService.get_adapter_type() == 'Ens.InboundAdapter'

    def test_on_process_input(self):
        hl7v2_file_service = Hl7v2FileService()
        hl7v2_file_service.on_init()
        # mock the send_request_sync method
        hl7v2_file_service.send_request_sync = MagicMock()
        # set the input_path to the tests directory
        hl7v2_file_service.input_path = os.path.join(os.path.dirname(__file__), 'data')
        hl7v2_file_service.on_process_input('message_input')
        # assert that the function does not raise an error
        assert True