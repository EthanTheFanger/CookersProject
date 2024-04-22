from flask import Blueprint, request, jsonify, make_response
import json
from src import db

recipe = Blueprint('recipe', __name__)

#define route
@recipe.route("/", methods=["GET"])

#gets all the recipes
def get_recipes():
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM Recipe")
    
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()

    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


#define route
@recipe.route("/difficulty", methods=['GET'])

#select all recipes that take less steps then the provided amount of steps
def max_difficulty():
    cursor = db.get_db().cursor()
    least = request.args.to_dict().get('least')

    steps = cursor.execute("SELECT * FROM Recipe WHERE LENGTH(column_name) - LENGTH(REPLACE(column_name, 'Step', '')) < {lesat};".format(least)) 
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

