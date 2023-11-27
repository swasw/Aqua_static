import sqlite3

conn = sqlite3.connect('aquabreeder.sqlite')

cursor = conn.cursor()

sql_query = """
CREATE TABLE user (
    id integer PRIMARY KEY,
    name text NOT NULL,
    nik text NOT NULL,
    breeder_id text NOT NULL,
    password text NOT NULL,
    public_key text,
    token text NOT NULL,
    phone_number text NOT NULL


)
"""
cursor.execute(sql_query)