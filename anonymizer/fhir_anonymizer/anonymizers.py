import hashlib
from datetime import datetime, timedelta
from time import strptime


def hash_string():
    return lambda x,y,z: hashlib.sha256(x.encode()).hexdigest()

def mask(value=None):
    if value is None:
        return lambda x,y,z: '*' * len(x)
    else:
        return lambda x,y,z: value

def peusdo():
    return lambda x,y,z: "PEUSDO"

def shift_time(offset_day=1):
    return lambda x,y,z: (datetime.strptime(x, '%Y-%m-%d') - timedelta(days=offset_day)).strftime('%Y-%m-%d')

def birth_date_shift():
    # move the birthdate to the last year 12/31
    # e.g. 1980-02-12 -> 1979-12-31
    return lambda x,y,z: f"{str(int(x[:4])-1)}-12-31"

def keep():
    return lambda x,y,z: x
