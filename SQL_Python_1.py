import sqlite3
import pandas as pd

######Task 1: Create a DB - Connect, check if there is similar and delete if exists
conn = sqlite3.connect('INSTRUCTOR.db')
cursor_obj = conn.cursor()


######Task 2: Create a table in the DB
cursor_obj.execute("DROP TABLE IF EXISTS INSTRUCTOR")
table = """ create table IF NOT EXISTS INSTRUCTOR(ID INTEGER PRIMARY KEY NOT NULL, FNAME VARCHAR(20), LNAME VARCHAR(20), CITY VARCHAR(20), CCODE CHAR(2));"""
cursor_obj.execute(table)
print("Table is Ready")

######Task 3:Insert data in table
cursor_obj.execute('''insert into INSTRUCTOR values (1, 'Rav', 'Ahuja', 'TORONTO', 'CA')''')
cursor_obj.execute('''insert into INSTRUCTOR values (2, 'Raul', 'Chong', 'Markham', 'CA'), (3, 'Hima', 'Vasudevan', 'Chicago', 'US')''')

######Task 4:Query DATA
"""statement = '''SELECT * FROM INSTRUCTOR'''      
cursor_obj.execute(statement)


output_all = cursor_obj.fetchall()
for row_all in output_all:
  print(row_all)"""

## Fetch few rows from the table
"""statement = '''SELECT * FROM INSTRUCTOR'''
cursor_obj.execute(statement)
  

# If you want to fetch few rows: fetchmany(numberofrows) 
output_many = cursor_obj.fetchmany(2) 
for row_many in output_many:
  print(row_many)"""

# Fetch only FNAME from the table
"""statement = '''SELECT FNAME FROM INSTRUCTOR'''
cursor_obj.execute(statement)
  

output_column = cursor_obj.fetchall()
for fetch in output_column:
  print(fetch)"""

#Update a Table
"""query_update='''update INSTRUCTOR set CITY='MOOSETOWN' where FNAME="Rav"'''
cursor_obj.execute(query_update)

statement = '''SELECT * FROM INSTRUCTOR'''
cursor_obj.execute(statement)

print("All the data")
output1 = cursor_obj.fetchmany(2)
for row in output1:
  print(row)"""

#####Task 5: Retrieve data into Pandas
df = pd.read_sql_query("select * from instructor;", conn)
#print(df)

#print just the LNAME for first row 
#print(df.LNAME[0])

#####Task 6: Close the Connection
conn.close()