from flask import Flask, request, jsonify
import sqlite3
import rsa
import json
import base64

with open("public.pem", "rb") as f:
    sv_public_key = rsa.PublicKey.load_pkcs1(f.read())

with open("private.pem", "rb") as f:
    sv_private_key = rsa.PrivateKey.load_pkcs1(f.read())

app = Flask(__name__)

def db_connection():
    conn = None
    try:
        conn = sqlite3.connect('aquabreeder.sqlite')
    except sqlite3.error as e:
        print(e)

    return conn

@app.route('/login', methods=['POST'])
def login():
    conn = db_connection()
    cursor = conn.cursor()
    user = None
    if request.method == 'POST':
        code = request.form['code']
        byte_msg = base64.urlsafe_b64decode(code)
        dec_msg = rsa.decrypt(byte_msg, sv_private_key)
        clear_msg = dec_msg.decode()
        json_msg = json.loads(clear_msg)

        breeder_id = json_msg['breeder_id']
        password = json_msg['password']
        token = json_msg['token']

        cursor.execute("SELECT * FROM user WHERE breeder_id=?", (breeder_id,))
        rows = cursor.fetchall()
        for r in rows:
            user = r

        if user is not None:
            if password == user[4] and token == user[6]:
                return "login success", 200
            else:
                return "Wrong", 404
            
        else:
            return "Wrong", 404


@app.route('/get_server_public_key', methods=['GET'])
def get_pbkey():
    if request.method == 'GET':
        with open("public.pem", "rb") as f:
            public_key = f.read()

        return public_key.decode(), 200

@app.route('/register', methods=['POST'])
def register():
    conn = db_connection()
    cursor = conn.cursor()
    if request.method == 'POST':
        code = request.form['code']
        byte_msg = base64.urlsafe_b64decode(code)

        dec_msg = rsa.decrypt(byte_msg, sv_private_key)
        clear_msg = dec_msg.decode()
        json_msg = json.loads(clear_msg)

        nik = json_msg['nik']
        name = json_msg['name']
        breeder_id = json_msg['breeder_id']
        password = json_msg['password']
        token = json_msg['token']
        phone_number = json_msg['phone_number']

        sql = """
INSERT INTO user(nik, breeder_id, password, token, name, phone_number) VALUES (?, ?, ?, ?, ?, ?)
"""
        cursor = cursor.execute(sql, (nik, breeder_id, password, token, name, phone_number))
        conn.commit()
        return "Register Success", 200



if __name__ == '__main__':
    app.run()