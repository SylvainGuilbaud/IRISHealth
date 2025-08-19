import pytest
import hashlib
from anonymizer.fhir_anonymizer.anonymizers import hash_string, mask, peusdo, shift_time, birth_date_shift, keep

def test_hash_string():
    hash_func = hash_string()
    assert hash_func("test", None, None) == hashlib.sha256("test".encode()).hexdigest()

def test_mask():
    mask_func = mask()
    assert mask_func("test", None, None) == "****"
    mask_func_with_value = mask("masked_value")
    assert mask_func_with_value("test", None, None) == "masked_value"

def test_peusdo():
    peusdo_func = peusdo()
    assert peusdo_func("test", None, None) == "PEUSDO"

def test_shift_time():
    shift_time_func = shift_time(1)
    assert shift_time_func("2023-10-10", None, None) == "2023-10-09"
    shift_time_func_custom = shift_time(5)
    assert shift_time_func_custom("2023-10-10", None, None) == "2023-10-05"

def test_birth_date_shift():
    birth_date_shift_func = birth_date_shift()
    assert birth_date_shift_func("1980-02-12", None, None) == "1979-12-31"

def test_keep():
    keep_func = keep()
    assert keep_func("test", None, None) == "test"

if __name__ == "__main__":
    pytest.main()