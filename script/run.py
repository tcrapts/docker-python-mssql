import pandas as pd
import pyodbc
import os

# configure connection
server = os.environ['SERVER']
username = os.environ['DB_USER']
password = os.environ['DB_PASSWORD']
database = os.environ['DATABASE']
connection =pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';PORT=1443;UID='+username+';PWD='+ password+';DATABASE='+database)

# read query
query = 'select top(10) * from tblRefBookingVersions'
cursor = connection.cursor()
cursor.execute(query)
df = pd.DataFrame([tuple(t) for t in cursor.fetchall()]) 
df.columns = [column[0] for column in cursor.description]
print(df)