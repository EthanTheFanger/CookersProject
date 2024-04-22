from flask import Blueprint, request, jsonify, make_response
import json
from src import db

login = Blueprint('login', __name__,)

#define route
@login.route("/", methods = ['GET'])

def check():
    cursor = db.get_db().cursor()
    username = request.args.get('username')
    password = request.args.get('password')

    #checks if the login and password are correct and in the database
    cursor.execute("SELECT Username FROM Login WHERE Username='{0}' AND Password='{1}'".format(username, password))
    cursor.close()

    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response