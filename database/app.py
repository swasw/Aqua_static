from flask import Flask, request,jsonify
import json
import sqlite3

app = Flask(__name__)


@app.route('/register_user', methods=['POST'])
def register_user():
    if request.method == 'POST':
        id = request.json.get('id')
        nik = request.json.get('nik')
        password = request.json.get('password')
        breeder_id = request.json.get('breeder_id')
        nama = request.json.get('nama')
        phone = request.json.get('phone')
        conn = sqlite3.connect('database.sqlite')

        if conn is not None:
            try:
                cursor = conn.cursor()
                cursor.execute("SELECT * FROM users WHERE breeder_id = ?", (breeder_id))
                existing_user = cursor.fetchone()

                if existing_user:
                    return jsonify({'error': 'Username already exists. Please choose a different username.'}), 400
                else:
                    cursor.execute("INSERT INTO users (id, nik, breeder_id, password, nama, phone) VALUES (?, ?, ?, ?, ?, ?)", (id, nik,breeder_id, password,nama, phone))
                    conn.commit()
                    return jsonify({'message': 'User registered successfully!'})
            except sqlite3.Error as e:
                return jsonify({'error': f'Error: {e}'}), 500
            finally:
                if conn:
                    conn.close()
    return jsonify({'error': 'Invalid request method'}), 405

if __name__ == '__main__':
    app.run(debug=True)