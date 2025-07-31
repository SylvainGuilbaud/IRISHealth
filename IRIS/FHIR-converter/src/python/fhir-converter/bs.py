import os

from hl7apy import parser

from iop import BusinessService

from msg import FhirConverterMessage

class Hl7v2FileService(BusinessService):

    def on_init(self):
        if not hasattr(self, 'input_path'):
            self.input_path = '/irisdev/app/data/input'
        if not hasattr(self, 'output_path'):
            self.output_path = '/irisdev/app/data/output'
        if not hasattr(self, 'archive_path'):
            self.archive_path = '/irisdev/app/data/archive'

    @staticmethod
    def get_adapter_type():
        return 'Ens.InboundAdapter'
    
    def on_process_input(self, message_input):
        # For each file ending in .hl7 in the input directory
        for file in os.listdir(self.input_path):
            if file.endswith('.hl7'):
                # Read the file with an utf-8 encoding and handle crlf or lf line endings
                with open(os.path.join(self.input_path, file), 'r', encoding='utf-8', newline=None) as f:
                    raw_message = f.read()
                    message = parser.parse_message(raw_message)
                    # guess the message type
                    message_type = 'Unknown'
                    try:
                        message_type = message.MSH.MSH_9.MSH_9_3.value or message.MSH.MSH_9.MSH_9_1.value+'_'+message.MSH.MSH_9.MSH_9_2.value
                    except:
                        pass
                    # create a FhirConverterMessage object
                    # input_data is the HL7 message as a string on one line
                    fcm = FhirConverterMessage(
                        input_filename=file,
                        input_data=raw_message,
                        input_data_type='Hl7v2',
                        root_template=message_type
                    )
                    # send the message to the FhirConverterProcess
                    self.send_request_sync('Python.FhirConverterProcess', fcm)
                    # move the file to the archive directory
                    os.rename(os.path.join(self.input_path, file), os.path.join(self.archive_path, file))
