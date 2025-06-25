import pandas as pd
import os
import getpass
if not 'IRISUSERNAME' in os.environ:
    os.environ['IRISUSERNAME'] = input('set IRISUSERNAME [_SYSTEM] :') or "_SYSTEM"
if not 'IRISPASSWORD' in os.environ:
    os.environ['IRISPASSWORD'] = getpass.getpass('set IRISPASSWORD [SYS]:') or 'SYS'
if not 'IRISNAMESPACE' in os.environ:
    os.environ['IRISNAMESPACE'] = input('set IRISNAMESPACE [IRISAPP] :') or "IRISAPP"

schema_name = input('set IRISSCHEMA [test] :') or "test"
directory = input('set directory [test] :') or "test"
import iris
from sqlalchemy import create_engine
iris.system.Process.SetNamespace(os.environ['IRISNAMESPACE'])
engine = create_engine('iris+emb:///')

# Create a fake csv file with a header as follows:
# Name, Date, Number
# John, 2020-01-01, 1

with open('test.csv', 'w') as f:
    f.write('Name,Date,Number\n')
    f.write('John, 31/01/2024, 1\n')
    f.write('John, 31/02/2024, 1\n')
    f.write('John, 31/03/2024, 1\n')
    f.write('John, 31/05/2024, 1\n')
    f.write('Null, , 1\n')

# Read the csv file
df = pd.read_csv('test.csv')
# df=pd.DataFrame([],columns=["Name","Date","Quantité"])

# Print the dataframe columns types
print(df.dtypes)

# Convert the Date column to datetime make sure to strip the white spaces and handle null values
df['Date'] = pd.to_datetime(df['Date'], errors='coerce')

# Print the dataframe columns types
print(df)
print(df.dtypes)


# df['Date'] = df['Date'].astype('int64') // 10**9

# # Convert the Timestamp column to datetime handle null values
# df['Date'] = pd.to_datetime(df['Date'], errors='coerce', unit='s')

# # Print the dataframe
# print(df)
# print(df.dtypes)


table_name="mvt_stocks"
query="DROP TABLE "+schema_name+"."+table_name
iris.sql.exec(query)

# query="CREATE TABLE "+schema_name+"."+table_name
# query=query+""" (
# 	name VARCHAR(65535),
# 	"Date" DATE,
# 	"Number" VARCHAR(65535)
#     )"""
# iris.sql.exec(query)

df.to_sql(table_name, engine, if_exists='append', index=False, schema=schema_name)