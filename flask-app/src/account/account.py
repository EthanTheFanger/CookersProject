from flask import Blueprint, request, jsonify, make_response
import json
from src import db

account = Blueprint('account', __name__,)

@account.route("/login", methods = ['GET'])
def loginCheck():
    cursor = db.get_db().cursor()
    username = request.args.get('username')
    password = request.args.get('password')

    #checks if the login and password are correct and in the database
    cursor.execute("SELECT Username FROM Login WHERE Username='{0}' AND Password='{1}'".format(username, password))

    result = cursor.fetchall()
    cursor.close()

    if result:
        return jsonify({'result': True}), 200
    else:
        return jsonify({'result': False}), 200

@account.route("/register", methods = ['GET','POST'])
def registerAccount():

    cursor = db.get_db().cursor()
    username = request.args.get('username')
    password = request.args.get('password')

    #checks if the login is already in the database
    cursor.execute("SELECT Username FROM Login WHERE Username='{0}'".format(username))
    result = cursor.fetchall()

    if result:
        return jsonify({'result': False, 'reason': 'Account already exists.'}), 200
    else:
        cursor.execute("INSERT INTO Login (Username, Password) VALUES ('{0}', '{1}')".format(username, password))
        db.get_db().commit()
        cursor.close()
        return jsonify({'result': True}), 200

@account.route("/delete", methods = ['GET','DELETE'])
def deleteAccount():
    cursor = db.get_db().cursor()
    username = request.args.get('username')

    cursor.execute("DELETE FROM Login WHERE Username='{0}'".format(username))
    db.get_db().commit()

    cursor.close()

    return jsonify({'result': True}), 200

@account.route("/updateUser", methods = ['GET','PUT'])
def updateUsername():
    cursor = db.get_db().cursor()
    CurrentUsername = request.args.get('currentUsername')
    NewUsername = request.args.get('newUsername')

    #Check if account exist
    cursor.execute("SELECT Username FROM Login WHERE Username='{0}'".format(CurrentUsername))
    result = cursor.fetchall()

    if not result:
        return jsonify({'result': False, 'reason': 'Username does not exist.'}), 200
    else:
        cursor.execute("UPDATE Login SET Username='{0}' WHERE Username='{1}'".format(NewUsername, CurrentUsername))
        db.get_db().commit()
        cursor.close()
        return jsonify({'result': True}), 200

@account.route("/updatePassword", methods = ['GET','PUT'])
def updatePassword():
    cursor = db.get_db().cursor()
    username = request.args.get('username')
    password = request.args.get('newPassword')

    #Check if account exist
    cursor.execute("SELECT Username FROM Login WHERE Username='{0}'".format(username))
    result = cursor.fetchall()

    if not result:
        return jsonify({'result': False, 'reason': 'Username does not exist.'}), 200
    else:
        cursor.execute("UPDATE Login SET Password='{0}' WHERE Username='{1}'".format(password, username))
        db.get_db().commit()
        cursor.close()
        return jsonify({'result': True}), 200

@account.route("/getUsers", methods = ['GET'])
def getUsers():
    cursor = db.get_db().cursor()
    username = request.args.get('username')

    if username:
        cursor.execute("SELECT Username FROM Login WHERE Username LIKE '%{0}%'".format(username))
    else: 
        cursor.execute("SELECT Username FROM Login")
    result = cursor.fetchall()
    cursor.close()

    return jsonify({'result': result}), 200

@account.route("/getName", methods = ['GET'])
def getUsersName():
    cursor = db.get_db().cursor()
    name = request.args.get('name')

    if name:
        cursor.execute("SELECT Name FROM User WHERE Name LIKE '%{0}%'".format(name))
    else: 
        cursor.execute("SELECT Name FROM User")
    result = cursor.fetchall()
    cursor.close()

    return jsonify({'result': result}), 200