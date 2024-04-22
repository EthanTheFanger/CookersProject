from flask import Blueprint, request, jsonify, make_response
import json
from src import db

user = Blueprint('user', __name__,)

@user.route("/<userid>/FavoritedRecipe", methods=['GET'])
def favorited_recipes(userid):
    cursor = db.get_db().cursor()

    cursor.execute("SELECT FavouriteRecipe, Name FROM Favourites JOIN Recipe ON Favourites.FavouriteRecipe = Recipe.RecipeID WHERE UserID = '{0}'".format(userid))

    results = cursor.fetchall()
    cursor.close()

    return jsonify(results), 200

@user.route("/<userid>/AddFavoritedRecipe/<recipeid>", methods=['GET','POST'])
def add_favorited_recipe(userid, recipeid):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM Favourites WHERE UserID = '{0}' AND FavouriteRecipe = '{1}'".format(userid, recipeid))
    existing_favorite = cursor.fetchone()

    if existing_favorite:
        return jsonify({'result': False, 'reason': 'Recipe already exists in favorites.'}), 400
    else:
        cursor.execute("INSERT INTO Favourites (UserID, FavouriteRecipe) VALUES ('{0}', '{1}')".format(userid, recipeid))
    db.get_db().commit()
    cursor.close()

    return jsonify({'result': True}), 200

@user.route("/<userid>/DeleteFavoritedRecipe/<recipeid>", methods=['GET','POST'])
def delete_favorited_recipe(userid, recipeid):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM Favourites WHERE UserID = '{0}' AND FavouriteRecipe = '{1}'".format(userid, recipeid))
    existing_favorite = cursor.fetchone()

    if existing_favorite:
        cursor.execute("DELETE FROM Favourites WHERE UserID = '{0}' AND FavouriteRecipe = '{1}'".format(userid, recipeid))
    else:
        return jsonify({'result': False, 'reason': 'Recipe does not exists in favorites.'}), 400
    db.get_db().commit()
    cursor.close()

    return jsonify({'result': True}), 200

@user.route("/<userid>/FoodRestrictions", methods=['GET', 'POST'])
def food_restrictions(userid):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT FoodRestrictions FROM FoodRestrictions WHERE UserID = '{0}'".format(userid))

    addFood_restrictions = request.args.getlist('foodRestrictions')

    
    if addFood_restrictions:
        for restriction in addFood_restrictions:
            cursor.execute("SELECT * FROM FoodRestrictions WHERE UserID = '{0}' AND FoodRestrictions = '{1}'".format(userid, restriction))
            existing_restriction = cursor.fetchone()
            if(existing_restriction):
                pass
            else:
                cursor.execute("INSERT INTO FoodRestrictions (UserID, FoodRestrictions) VALUES ('{0}', '{1}')".format(userid, restriction))
            db.get_db().commit()
        return jsonify({'result': True}), 200
    else:
        results = cursor.fetchall()
        cursor.close()

        return jsonify(results), 200

@user.route("/<userid>/Allergies", methods=['GET', 'POST'])
def allergies(userid):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT Allergies FROM Allergies WHERE UserID = '{0}'".format(userid))

    addAllergies = request.args.getlist('allergies')

    if addAllergies:
        for allergy in addAllergies:
            cursor.execute("SELECT * FROM Allergies WHERE UserID = '{0}' AND Allergies = '{1}'".format(userid, allergy))
            existing_allergy = cursor.fetchone()
            if(existing_allergy):
                pass
            else:
                cursor.execute("INSERT INTO Allergies (UserID, Allergies) VALUES ('{0}', '{1}')".format(userid, allergy))
            db.get_db().commit()
        return jsonify({'result': True}), 200   
    else:
        results = cursor.fetchall()
        cursor.close()
        return jsonify(results), 200


@user.route("/<userid>/MadeRecipes", methods=['GET', 'POST', 'DELETE'])
def userMade(userid):
    cursor = db.get_db().cursor()

    addRecipesMade = request.args.getlist('recipesMade')
    deleteRecipesMade = request.args.getlist('deleteRecipesMade')

    if addRecipesMade:
        for recipeMade in addRecipesMade:
            cursor.execute("SELECT UserID, RecipeID FROM UserMade WHERE UserID = '{0} AND RecipeID = {1}'".format(userid, recipeMade))
            existing_recipe = cursor.fetchone()
            if(existing_recipe):
                pass
            else:
                cursor.execute("INSERT INTO UserMade (UserID, RecipeID) VALUES ('{0}', '{1}')".format(userid, recipeMade))
            db.get_db().commit()
        return jsonify({'result': True}), 200
    elif deleteRecipesMade:
        for recipeMade in deleteRecipesMade:
            cursor.execute("SELECT UserID, RecipeID FROM UserMade WHERE UserID = '{0} AND RecipeID = {1}'".format(userid, recipeMade))
            existing_recipe = cursor.fetchone()
            if(existing_recipe):
                cursor.execute("DELETE FROM UserMade WHERE UserID = '{0}' AND RecipeID = '{1}'".format(userid, recipeMade))
            else:
                return jsonify({'result': False, 'reason': 'Recipe does not exists in made recipes.'}), 400
            db.get_db().commit()
        return jsonify({'result': True}), 200
    else:
        cursor.execute("SELECT UserMade.RecipeID, Name FROM UserMade JOIN Recipe ON UserMade.RecipeID = Recipe.RecipeID WHERE UserID = '{0}'".format(userid))
        cursor.close()
        results = cursor.fetchall()
        return jsonify(results), 200
    
@user.route("/<userid>/TotalNutrition", methods=['GET'])
def userNutrition(userid):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT SUM(Calories), SUM(TotalCarbohydrate), SUM(Protein), SUM(Sodium), SUM(Cholestrol) FROM UserMade JOIN Nutrition ON Nutrition.RecipeID = UserMade.RecipeID WHERE UserID = '{0}'".format(userid))
    results = cursor.fetchall()
    cursor.close()

    sums = {
        'Calories': results[0][0],
        'TotalCarbohydrate': results[0][1],
        'Protein': results[0][2],
        'Sodium': results[0][3],
        'Cholestrol': results[0][4]
    }

    return jsonify(sums), 200
