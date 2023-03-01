from flask import Flask, request
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/")
db = client["mydatabase"]

@app.route('/add_user', methods=['POST'])
def add_user():
    name = request.json['name']
    email = request.json['email']
    new_user = {"name": name, "email": email}
    db.users.insert_one(new_user)
    return 'User added successfully!'
