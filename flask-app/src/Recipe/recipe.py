from flask import Blueprint, request, jsonify, make_response
import json
from src import db

recipe = Blueprint('recipe', __name__)

#define route
@recipe.route("/difficulty", methods=['GET'])

#select all recipes that take less time then the provided amount of time
def max_difficulty():
    cursor = db.get_db().cursor()
    least = request.args.get('least')

    steps = cursor.execute("SELECT * FROM Recipes WHERE {least} > SELECT COUNT(*) FROM recipes WHERE LOWER(Steps) LIKE '%step%' ")
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

#specify route
@recipe.route("/excludeingredients", methods=['GET'])

def withoutingredients():
    return 0
    