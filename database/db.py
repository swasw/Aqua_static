import sqlite3

conn = sqlite3.connect('database.sqlite')
cur = conn.cursor()
# Create a table 90named 'users'
cur.execute('''
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY,
        nik INTEGER,
        breeder_id TEXT,
        password TEXT,
        nama TEXT,
        phone INTEGER
    )
''')
conn.commit()
