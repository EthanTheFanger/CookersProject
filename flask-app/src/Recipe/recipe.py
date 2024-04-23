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
    most = request.args.to_dict().get('most')

    recipes = cursor.execute("SELECT * FROM Recipe WHERE (LENGTH(Steps) - LENGTH(REPLACE(Steps, 'Step', '')))/4 <= %s;", (most)) 
    result = cursor.fetchall()
    cursor.close()

    return jsonify({'result': result}), 200

#define function
@recipe.route("/include", methods=["GET"])

#Returns a list of recipes that include the provided list of ingredients
def include_ingredients():
    cursor = db.get_db().cursor()
    ingredients = request.args.to_dict().get('ingredients')

    cursor.execute("SELECT * FROM Recipe JOIN Ingredients ON Recipe.RecipeID = Ingredients.RecipeID WHERE Ingredients.Ingredient NOT IN {ingredients};", {ingredients})

    result = cursor.fetchall()
    cursor.close()
    return jsonify({'result': result}), 200

@recipe.route("/exclude", methods=["GET"])

#returns a list of recipes that exclude the rpovided list of ingredients
def exclude_ingredients():
    cursor = db.get_db().cursor()
    ingredients = request.args.to_dict().get('ingredients')

    cursor.execute("SELECT * FROM Recipe JOIN Ingredients ON Recipe.RecipeID = Ingredients.RecipeID WHERE Ingredients.Ingredient IN {ingredients};", {ingredients})

    result = cursor.fetchall()
    cursor.close()
    return jsonify({'result': result}), 200

