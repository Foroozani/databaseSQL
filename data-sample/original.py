
# After installing with pip install psycopg2
import psycopg2 as pg2

conn = pg2.connect(database='postgres', user='postgres',password='password')

# Establish connection and start cursor to be ready to query
cur = conn.cursor()

# Pass in a PostgreSQL query as a string
cur.execute("SELECT * FROM payment")

# Return a tuple of the first row as Python objects
cur.fetchone()

# Return N number of rows
cur.fetchmany(10)

# Return All rows at once
cur.fetchall()

# To save and index results, assign it to a variable
data = cur.fetchmany(10)

# **Inserting Information**

query1 = '''
        CREATE TABLE new_table (
            userid integer
            , tmstmp timestamp
            , type varchar(10)
        );
        '''

cur.execute(query1)

# commit the changes to the database
cur.commit()
conn.close()

