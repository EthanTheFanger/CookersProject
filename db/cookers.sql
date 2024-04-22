CREATE DATABASE IF NOT EXISTS CookerDatabase;
USE CookerDatabase;

CREATE TABLE IF NOT EXISTS Login
(
    Username varchar(255) UNIQUE,
    Password varchar(255),
    PRIMARY KEY(Username)
);

CREATE TABLE IF NOT EXISTS User
(
    UserID int UNIQUE,
    Name varchar(255),
    Budget int,
    health varchar(255),
    Username varchar(255) UNIQUE,
    PRIMARY KEY(UserID),
    # we want the child table to be set to null when the parent is deleted
    FOREIGN KEY(Username) REFERENCES Login(Username)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Recipe
(
    RecipeID int UNIQUE,
    Name varchar(255),
    Cost int,
    TimeToMake int,
    LactoseFree BOOL,
    GlutenFree BOOL,
    Views int,
    Steps TEXT,
    Culture varchar(255),
    DateCreated DATE,
    PRIMARY KEY(RecipeID)
);

CREATE TABLE IF NOT EXISTS FoodRestrictions
(
    UserID int,
    FoodRestrictions varchar(255),
    PRIMARY KEY(UserID, FoodRestrictions),
    FOREIGN KEY(UserID) REFERENCES User(UserID)
    ON UPDATE no action
    ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS Allergies
(
    UserID int,
    Allergies varchar(255),
    PRIMARY KEY(UserID, Allergies),
    FOREIGN KEY(UserID) REFERENCES User(UserID)
    ON UPDATE no action
    ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS Favourites
(
    UserID int,
    FavouriteRecipe int,
    PRIMARY KEY(UserID, FavouriteRecipe),
    FOREIGN KEY(UserID) REFERENCES User(UserID)
    ON UPDATE no action
    ON DELETE cascade,
    FOREIGN KEY(FavouriteRecipe) REFERENCES Recipe(RecipeID)
    ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS Comment
(
    UserID int,
    CommentID varchar(255) UNIQUE,
    RecipeID int,
    Text TEXT,
    Commenter varchar(255),
    Likes int,
    Date DATE,
    PRIMARY KEY(UserID, CommentID, RecipeID),
    FOREIGN KEY(RecipeID) REFERENCES Recipe(RecipeID)
    ON UPDATE no action
    ON DELETE cascade,
    FOREIGN KEY(UserID) REFERENCES User(UserID)
    ON DELETE no action
);

CREATE TABLE IF NOT EXISTS UserMade
(
    UserID int,
    RecipeID int,
    Rating int,
    Datemade DATE,
    FOREIGN KEY(RecipeID) REFERENCES Recipe(RecipeID)
    ON UPDATE no action
    ON DELETE set null,
    FOREIGN KEY(UserID) REFERENCES User(UserID)
    ON UPDATE no action
    ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS Ingredients
(
    RecipeID int,
    Ingredient varchar(255),
    PRIMARY KEY(RecipeID, Ingredient),
    FOREIGN KEY(RecipeID) REFERENCES Recipe(RecipeID)
    ON UPDATE no action
    ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS Nutrition
(
    RecipeID int,
    Calories int,
    TotalCarbohydrate int,
    Sodium int,
    Protein int,
    Cholestrol int,
    FOREIGN KEY(RecipeID) REFERENCES Recipe(RecipeID)
    ON UPDATE no action
    ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS RecommendationList
(
    UserID int,
    ListID int,
    DateCreated DATE,
    PRIMARY KEY(UserID, ListID),
    FOREIGN KEY(UserID) REFERENCES User(UserID)
    ON UPDATE no action
    ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS RecommendationRecipe
(
    UserID int,
    ListID int,
    Recipe int,
    PRIMARY KEY(UserID, ListID, Recipe),
    FOREIGN KEY(UserID, ListID) REFERENCES RecommendationList(UserID, ListID)
    ON UPDATE cascade
    ON DELETE cascade,
    FOREIGN KEY(Recipe) REFERENCES Recipe(RecipeID)
    ON UPDATE no action
    ON DELETE cascade
);