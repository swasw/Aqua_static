from flask import flash, redirect, url_for, request, jsonify
from app import app, db
from flask_login import current_user, login_user, logout_user, login_required
import sqlalchemy as sa
from app.models import User
from urllib.parse import urlsplit
from datetime import datetime, timezone

@app.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return "already logged in", 200
    
    if request.method == 'POST':
        username = request.form['username']
        
        user = db.session.scalar(
            sa.select(User).where(User.username == username)
        )

        if user is None or not user.check_password(request.form['password']):
            return "Invalid Username or Password", 404
        
        login_user(user, True)
        
        return "Login Success", 200
    
        
    
@app.route('/register', methods=['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return 200
    
    if request.method == 'POST':
        un = request.form['username']
        niek = request.form['nik']
        nama = request.form['name']
        pn = request.form['phone_number']

        user = User(username=un, nik=niek, name=nama, phone_number=pn)
        user.set_password(request.form['password'])
        db.session.add(user)
        db.session.commit()
        
        return "Register Success", 200 
    
@app.route('/logout')
def logout():
    logout_user()
    return "Logout success", 200
        
