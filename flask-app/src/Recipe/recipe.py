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
    ingredients = tuple(request.args.get('ingredients').split(','))

    cursor.execute("SELECT * FROM Recipe JOIN Ingredients ON Recipe.RecipeID = Ingredients.RecipeID WHERE Ingredients.Ingredient IN (%s);" % (','.join(['%s'] * len(ingredients))), ingredients)

    result = cursor.fetchall()
    cursor.close()
    return jsonify({'result': result}), 200

@recipe.route("/exclude", methods=["GET"])

#returns a list of recipes that exclude the rpovided list of ingredients
def exclude_ingredients():
    cursor = db.get_db().cursor()
    ingredients = tuple(request.args.get('ingredients').split(','))

    cursor.execute("SELECT * FROM Recipe JOIN Ingredients ON Recipe.RecipeID = Ingredients.RecipeID WHERE Ingredients.Ingredient NOT IN (%s);" % (','.join(['%s'] * len(ingredients))), ingredients)

    result = cursor.fetchall()
    cursor.close()
    return jsonify({'result': result}), 200

@recipe.route("/minimumnutrients", methods=["GET"])

#Returns a list of recipes that meets the minimum nutrition rating provided by the user
def min_nutrients():
    cursor = db.get_db().cursor()
    calories = request.args.get('calories')
    carbohydrate = request.args.get('carbohydrate')
    sodium = request.args.get('sodium')
    protein = request.args.get('protein')
    Cholestrol = request.args.get('cholestrol')

    cursor.execute("SELECT * FROM Nutrition WHERE Nutrition.Calories < %s AND Nutrition.TotalCarbohydrate < %s AND Nutrition.Sodium < %s AND Nutrition.Protein < %s AND Nutrition.Cholestrol < %s ORDER BY Nutrition.RecipeID", (calories, carbohydrate, sodium, protein, Cholestrol)) 
    result = cursor.fetchall()
    cursor.close()
    return jsonify({'result': result}), 200

@recipe.route("/recommended", methods=["GET"])

#Returns a list of recipes suggested to the user using their own preferences.
def recommended():
    cursor = db.get_db().cursor()
    userid = request.args.to_dict().get('userid')

    cursor.execute("SELECT Recipe.RecipeID, Recipe.Steps, Recipe.Name FROM RecommendationList JOIN RecommendationRecipe ON RecommendationList.ListID = RecommendationRecipe.ListID JOIN Recipe ON RecommendationRecipe.Recipe = Recipe.RecipeID WHERE RecommendationList.UserID = %s", (userid))
    result = cursor.fetchall()
    cursor.close()
    return jsonify({'result': result}), 200


# adds information about the recipe uploaded by the user
@recipe.route("/add", methods=["POST", "GET"])
def addrecipe():
    cursor = db.get_db().cursor()
    recipeid = request.args.get('recipeid')
    name = request.args.get('name')
    cost = request.args.get('cost')
    time = request.args.get('time')
    lactose = request.args.get('lactose')
    gluten = request.args.get('gluten')
    views = request.args.get('views')
    steps = request.args.get('steps')
    culture = request.args.get('culture')
    datecreated = request.args.get('datecreated')

    cursor.execute("INSERT INTO Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}')".format(recipeid, name, cost, time, lactose, gluten, views, steps, culture, datecreated))
    db.get_db().commit()
    cursor.close()
    return jsonify({'result': True}), 200