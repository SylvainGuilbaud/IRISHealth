from iop import Message
from dataclasses import dataclass

@dataclass
class FhirRequest(Message):
    url: str
    resource: str
    method: str
    data: str
    headers: dict

@dataclass
class FhirResponse(Message):
    status_code: int
    content: str
    headers: dict
    resource: str