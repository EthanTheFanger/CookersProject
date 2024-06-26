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


USE CookerDatabase;

#Populate Login
DELETE FROM Login;
insert into Login (Username, Password) values ('credington0', '0dlUXY597900wn');
insert into Login (Username, Password) values ('dcaffin1', '3ffPOFETjq22ge');
insert into Login (Username, Password) values ('tdeas2', '2meSSGNRk856hn');
insert into Login (Username, Password) values ('amanshaw3', '7xoVWS3Lcm73wm');
insert into Login (Username, Password) values ('asuett4', '7zjGLDGBsh34eq');
insert into Login (Username, Password) values ('vbernardeschi5', '4riRVUQRkr47jh');
insert into Login (Username, Password) values ('fraoux6', '5boEAF0Ojy07cm');
insert into Login (Username, Password) values ('atantrum7', '0vrWONBKku25gp');
insert into Login (Username, Password) values ('bmcavinchey8', '2mmSRM9J8a68cg');
insert into Login (Username, Password) values ('dallner9', '8ciNON9Fwc36hi');
insert into Login (Username, Password) values ('scabblea', '3fqFXUQUpa03ie');
insert into Login (Username, Password) values ('ttudballb', '9oqHJSZJd499yt');
insert into Login (Username, Password) values ('dmoorfieldc', '9zgPZG8Uv160es');
insert into Login (Username, Password) values ('acathcartd', '8mkHWZMCet76fz');
insert into Login (Username, Password) values ('eaddenbrookee', '2lzCGHECw227zj');
insert into Login (Username, Password) values ('bnuttf', '5amICWN7se30to');
insert into Login (Username, Password) values ('cmorradg', '0rkKCIXAdy61fe');
insert into Login (Username, Password) values ('cgiblinh', '2wbILGECm502uu');
insert into Login (Username, Password) values ('atatheri', '4vzLAD9I5737qw');
insert into Login (Username, Password) values ('edemitrij', '8jeRBMFUag68br');
insert into Login (Username, Password) values ('ghallahank', '9xjFNLJ6h344kn');
insert into Login (Username, Password) values ('jcoltherdl', '6pvXMGICag71fq');
insert into Login (Username, Password) values ('cbottomorem', '7bfNIARBm980rj');
insert into Login (Username, Password) values ('kakriggn', '0mwGPSCYr548wz');
insert into Login (Username, Password) values ('lodonegano', '1ujYRBUKef31dp');
insert into Login (Username, Password) values ('dbrunsdonp', '5kcIYIJQdm08st');
insert into Login (Username, Password) values ('mworsfoldq', '4whYYKUUud34jl');
insert into Login (Username, Password) values ('abeardonr', '5igHQF2H5f55rf');
insert into Login (Username, Password) values ('ppedersens', '9mtTCQIB6n29om');
insert into Login (Username, Password) values ('lwisamt', '9uzCCXQDji68tb');
insert into Login (Username, Password) values ('jeshu', '5zbRXOCEjl42nk');
insert into Login (Username, Password) values ('tslaffordv', '2rbCAFI33180ja');
insert into Login (Username, Password) values ('enanniniw', '2qzBADBCeu83oa');
insert into Login (Username, Password) values ('amalpassx', '1hfRPD4Lmc52gi');
insert into Login (Username, Password) values ('hwaumsleyy', '5rwBRKMUi765vm');
insert into Login (Username, Password) values ('eburtonshawz', '1iqKBKVDgr99sh');
insert into Login (Username, Password) values ('tbrecher10', '0wuSLC4Dc902po');
insert into Login (Username, Password) values ('mcoolahan11', '5avQZT7Mz053ge');
insert into Login (Username, Password) values ('mbalme12', '0ccWGNZ89g38am');
insert into Login (Username, Password) values ('ideclerc13', '8jbTSVF5we23cu');

#Populate User
DELETE From User;
insert into User (UserID, Name, Budget, Health, Username) values (1, 'Alex Ramirez', 141.18, 'Bad', 'credington0');
insert into User (UserID, Name, Budget, Health, Username) values (2, 'Amy Green', 168.07, 'Good', 'dcaffin1');
insert into User (UserID, Name, Budget, Health, Username) values (3, 'Emily Stone', 112.56, 'Average', 'tdeas2');
insert into User (UserID, Name, Budget, Health, Username) values (4, 'William Gupta', 187, 'Bad', 'amanshaw3');
insert into User (UserID, Name, Budget, Health, Username) values (5, 'Fanya Huygen', 87.52, 'Average', 'asuett4');
insert into User (UserID, Name, Budget, Health, Username) values (6, 'Hunfredo Stinton', 109.02, 'Excellent', 'vbernardeschi5');
insert into User (UserID, Name, Budget, Health, Username) values (7, 'Bekki Bothbie', 106.1, 'Excellent', 'fraoux6');
insert into User (UserID, Name, Budget, Health, Username) values (8, 'Colman Abrey', 19.1, 'Horrible', 'atantrum7');
insert into User (UserID, Name, Budget, Health, Username) values (9, 'Melissa Bumfrey', 162.33, 'Excellent', 'bmcavinchey8');
insert into User (UserID, Name, Budget, Health, Username) values (10, 'Walton Luetchford', 52.31, 'Horrible', 'dallner9');
insert into User (UserID, Name, Budget, Health, Username) values (11, 'Merralee McDool', 4.21, 'Horrible', 'scabblea');
insert into User (UserID, Name, Budget, Health, Username) values (12, 'Lisha Haggish', 132.64, 'Average', 'ttudballb');
insert into User (UserID, Name, Budget, Health, Username) values (13, 'Eduardo Cowper', 105.04, 'Average', 'dmoorfieldc');
insert into User (UserID, Name, Budget, Health, Username) values (14, 'Werner Waind', 163.39, 'Bad', 'acathcartd');
insert into User (UserID, Name, Budget, Health, Username) values (15, 'Rorie Gaitskill', 72.53, 'Good', 'eaddenbrookee');
insert into User (UserID, Name, Budget, Health, Username) values (16, 'Willi Llywarch', 66.78, 'Excellent', 'bnuttf');
insert into User (UserID, Name, Budget, Health, Username) values (17, 'Sayre Upward', 194.13, 'Bad', 'cmorradg');
insert into User (UserID, Name, Budget, Health, Username) values (18, 'Allyn Scimonelli', 142.15, 'Good', 'cgiblinh');
insert into User (UserID, Name, Budget, Health, Username) values (19, 'Ole Drakes', 57.91, 'Average', 'atatheri');
insert into User (UserID, Name, Budget, Health, Username) values (20, 'Andie Treneer', 134.22, 'Average', 'edemitrij');
insert into User (UserID, Name, Budget, Health, Username) values (21, 'Umeko Hanhardt', 37.96, 'Good', 'ghallahank');
insert into User (UserID, Name, Budget, Health, Username) values (22, 'Isacco Cooke', 177.99, 'Good', 'jcoltherdl');
insert into User (UserID, Name, Budget, Health, Username) values (23, 'Vaughan Olford', 13.75, 'Average', 'cbottomorem');
insert into User (UserID, Name, Budget, Health, Username) values (24, 'Lin Dougherty', 76.74, 'Horrible', 'kakriggn');
insert into User (UserID, Name, Budget, Health, Username) values (25, 'Moss Coot', 88.22, 'Average', 'lodonegano');
insert into User (UserID, Name, Budget, Health, Username) values (26, 'Charleen Orford', 28.19, 'Average', 'dbrunsdonp');
insert into User (UserID, Name, Budget, Health, Username) values (27, 'Cord Bolzmann', 196.78, 'Excellent', 'mworsfoldq');
insert into User (UserID, Name, Budget, Health, Username) values (28, 'Elyn Witherspoon', 17.16, 'Good', 'abeardonr');
insert into User (UserID, Name, Budget, Health, Username) values (29, 'Jamaal Marzelo', 196.37, 'Excellent', 'ppedersens');
insert into User (UserID, Name, Budget, Health, Username) values (30, 'Demetrius Craister', 25.41, 'Excellent', 'lwisamt');
insert into User (UserID, Name, Budget, Health, Username) values (31, 'Merlina Dows', 22.59, 'Bad', 'jeshu');
insert into User (UserID, Name, Budget, Health, Username) values (32, 'Aron Terbruggen', 11.1, 'Bad', 'tslaffordv');
insert into User (UserID, Name, Budget, Health, Username) values (33, 'Caterina Voyce', 151.76, 'Good', 'enanniniw');
insert into User (UserID, Name, Budget, Health, Username) values (34, 'Grace Kieran', 132.36, 'Bad', 'amalpassx');
insert into User (UserID, Name, Budget, Health, Username) values (35, 'Lucie MacDwyer', 34.69, 'Good', 'hwaumsleyy');
insert into User (UserID, Name, Budget, Health, Username) values (36, 'Juana Kirkbright', 166.1, 'Good', 'eburtonshawz');
insert into User (UserID, Name, Budget, Health, Username) values (37, 'Magdalene Waterstone', 173.11, 'Average', 'tbrecher10');
insert into User (UserID, Name, Budget, Health, Username) values (38, 'Nicolis Dolton', 20.46, 'Excellent', 'mcoolahan11');
insert into User (UserID, Name, Budget, Health, Username) values (39, 'Lemmy Skewes', 166.42, 'Excellent', 'mbalme12');
insert into User (UserID, Name, Budget, Health, Username) values (40, 'Aime Antoniewicz', 47.91, 'Horrible', 'ideclerc13');

#Populate FoodRestrictions
DELETE From FoodRestrictions;
insert into FoodRestrictions (UserID, FoodRestrictions) values (1, 'vegetarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (2, 'vegan');
insert into FoodRestrictions (UserID, FoodRestrictions) values (3, 'gluten-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (4, 'dairy-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (5, 'nut-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (6, 'pescatarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (7, 'halal');
insert into FoodRestrictions (UserID, FoodRestrictions) values (8, 'kosher');
insert into FoodRestrictions (UserID, FoodRestrictions) values (9, 'low-carb');
insert into FoodRestrictions (UserID, FoodRestrictions) values (10, 'sugar-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (11, 'organic');
insert into FoodRestrictions (UserID, FoodRestrictions) values (12, 'locally-sourced');
insert into FoodRestrictions (UserID, FoodRestrictions) values (13, 'raw');
insert into FoodRestrictions (UserID, FoodRestrictions) values (14, 'paleo');
insert into FoodRestrictions (UserID, FoodRestrictions) values (15, 'flexitarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (16, 'macrobiotic');
insert into FoodRestrictions (UserID, FoodRestrictions) values (17, 'whole30');
insert into FoodRestrictions (UserID, FoodRestrictions) values (18, 'carnivore');
insert into FoodRestrictions (UserID, FoodRestrictions) values (19, 'fruitarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (20, 'breatharian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (21, 'freegan');
insert into FoodRestrictions (UserID, FoodRestrictions) values (22, 'meatless');
insert into FoodRestrictions (UserID, FoodRestrictions) values (23, 'soy-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (24, 'non-GMO');
insert into FoodRestrictions (UserID, FoodRestrictions) values (25, 'sustainable');
insert into FoodRestrictions (UserID, FoodRestrictions) values (26, 'vegetarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (27, 'vegan');
insert into FoodRestrictions (UserID, FoodRestrictions) values (28, 'gluten-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (29, 'dairy-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (30, 'nut-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (31, 'pescatarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (32, 'halal');
insert into FoodRestrictions (UserID, FoodRestrictions) values (33, 'kosher');
insert into FoodRestrictions (UserID, FoodRestrictions) values (34, 'low-carb');
insert into FoodRestrictions (UserID, FoodRestrictions) values (35, 'sugar-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (36, 'organic');
insert into FoodRestrictions (UserID, FoodRestrictions) values (37, 'locally-sourced');
insert into FoodRestrictions (UserID, FoodRestrictions) values (38, 'raw');
insert into FoodRestrictions (UserID, FoodRestrictions) values (39, 'paleo');
insert into FoodRestrictions (UserID, FoodRestrictions) values (40, 'flexitarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (1, 'macrobiotic');
insert into FoodRestrictions (UserID, FoodRestrictions) values (2, 'whole30');
insert into FoodRestrictions (UserID, FoodRestrictions) values (3, 'carnivore');
insert into FoodRestrictions (UserID, FoodRestrictions) values (4, 'fruitarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (5, 'breatharian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (6, 'freegan');
insert into FoodRestrictions (UserID, FoodRestrictions) values (7, 'meatless');
insert into FoodRestrictions (UserID, FoodRestrictions) values (8, 'soy-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (9, 'non-GMO');
insert into FoodRestrictions (UserID, FoodRestrictions) values (10, 'sustainable');
insert into FoodRestrictions (UserID, FoodRestrictions) values (11, 'vegetarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (12, 'vegan');
insert into FoodRestrictions (UserID, FoodRestrictions) values (13, 'gluten-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (14, 'dairy-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (15, 'nut-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (16, 'pescatarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (17, 'halal');
insert into FoodRestrictions (UserID, FoodRestrictions) values (18, 'kosher');
insert into FoodRestrictions (UserID, FoodRestrictions) values (19, 'low-carb');
insert into FoodRestrictions (UserID, FoodRestrictions) values (20, 'sugar-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (21, 'organic');
insert into FoodRestrictions (UserID, FoodRestrictions) values (22, 'locally-sourced');
insert into FoodRestrictions (UserID, FoodRestrictions) values (23, 'raw');
insert into FoodRestrictions (UserID, FoodRestrictions) values (24, 'paleo');
insert into FoodRestrictions (UserID, FoodRestrictions) values (25, 'flexitarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (26, 'macrobiotic');
insert into FoodRestrictions (UserID, FoodRestrictions) values (27, 'whole30');
insert into FoodRestrictions (UserID, FoodRestrictions) values (28, 'carnivore');
insert into FoodRestrictions (UserID, FoodRestrictions) values (29, 'fruitarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (30, 'breatharian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (31, 'freegan');
insert into FoodRestrictions (UserID, FoodRestrictions) values (32, 'meatless');
insert into FoodRestrictions (UserID, FoodRestrictions) values (33, 'soy-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (34, 'non-GMO');
insert into FoodRestrictions (UserID, FoodRestrictions) values (35, 'sustainable');
insert into FoodRestrictions (UserID, FoodRestrictions) values (36, 'vegetarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (37, 'vegan');
insert into FoodRestrictions (UserID, FoodRestrictions) values (38, 'gluten-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (39, 'dairy-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (40, 'nut-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (1, 'pescatarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (2, 'halal');
insert into FoodRestrictions (UserID, FoodRestrictions) values (3, 'kosher');
insert into FoodRestrictions (UserID, FoodRestrictions) values (4, 'low-carb');
insert into FoodRestrictions (UserID, FoodRestrictions) values (5, 'sugar-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (6, 'organic');
insert into FoodRestrictions (UserID, FoodRestrictions) values (7, 'locally-sourced');
insert into FoodRestrictions (UserID, FoodRestrictions) values (8, 'raw');
insert into FoodRestrictions (UserID, FoodRestrictions) values (9, 'paleo');
insert into FoodRestrictions (UserID, FoodRestrictions) values (10, 'flexitarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (11, 'macrobiotic');
insert into FoodRestrictions (UserID, FoodRestrictions) values (12, 'whole30');
insert into FoodRestrictions (UserID, FoodRestrictions) values (13, 'carnivore');
insert into FoodRestrictions (UserID, FoodRestrictions) values (14, 'fruitarian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (15, 'breatharian');
insert into FoodRestrictions (UserID, FoodRestrictions) values (16, 'freegan');
insert into FoodRestrictions (UserID, FoodRestrictions) values (17, 'meatless');
insert into FoodRestrictions (UserID, FoodRestrictions) values (18, 'soy-free');
insert into FoodRestrictions (UserID, FoodRestrictions) values (19, 'non-GMO');
insert into FoodRestrictions (UserID, FoodRestrictions) values (20, 'sustainable');

#Populate Allergies
DELETE From CookerDatabase.Allergies;
insert into Allergies (UserID, Allergies) values (1, 'peanuts');
insert into Allergies (UserID, Allergies) values (2, 'shellfish');
insert into Allergies (UserID, Allergies) values (3, 'gluten');
insert into Allergies (UserID, Allergies) values (4, 'dairy');
insert into Allergies (UserID, Allergies) values (5, 'soy');
insert into Allergies (UserID, Allergies) values (6, 'eggs');
insert into Allergies (UserID, Allergies) values (7, 'wheat');
insert into Allergies (UserID, Allergies) values (8, 'fish');
insert into Allergies (UserID, Allergies) values (9, 'tree nuts');
insert into Allergies (UserID, Allergies) values (10, 'sesame');
insert into Allergies (UserID, Allergies) values (11, 'mustard');
insert into Allergies (UserID, Allergies) values (12, 'sulfites');
insert into Allergies (UserID, Allergies) values (13, 'corn');
insert into Allergies (UserID, Allergies) values (14, 'lactose');
insert into Allergies (UserID, Allergies) values (15, 'milk');
insert into Allergies (UserID, Allergies) values (16, 'chocolate');
insert into Allergies (UserID, Allergies) values (17, 'strawberries');
insert into Allergies (UserID, Allergies) values (18, 'kiwi');
insert into Allergies (UserID, Allergies) values (19, 'pineapple');
insert into Allergies (UserID, Allergies) values (20, 'avocado');
insert into Allergies (UserID, Allergies) values (21, 'mango');
insert into Allergies (UserID, Allergies) values (22, 'banana');
insert into Allergies (UserID, Allergies) values (23, 'tomato');
insert into Allergies (UserID, Allergies) values (24, 'peas');
insert into Allergies (UserID, Allergies) values (25, 'carrots');
insert into Allergies (UserID, Allergies) values (26, 'peanuts');
insert into Allergies (UserID, Allergies) values (27, 'shellfish');
insert into Allergies (UserID, Allergies) values (28, 'gluten');
insert into Allergies (UserID, Allergies) values (29, 'dairy');
insert into Allergies (UserID, Allergies) values (30, 'soy');
insert into Allergies (UserID, Allergies) values (31, 'eggs');
insert into Allergies (UserID, Allergies) values (32, 'wheat');
insert into Allergies (UserID, Allergies) values (33, 'fish');
insert into Allergies (UserID, Allergies) values (34, 'tree nuts');
insert into Allergies (UserID, Allergies) values (35, 'sesame');
insert into Allergies (UserID, Allergies) values (36, 'mustard');
insert into Allergies (UserID, Allergies) values (37, 'sulfites');
insert into Allergies (UserID, Allergies) values (38, 'corn');
insert into Allergies (UserID, Allergies) values (39, 'lactose');
insert into Allergies (UserID, Allergies) values (40, 'milk');
insert into Allergies (UserID, Allergies) values (1, 'chocolate');
insert into Allergies (UserID, Allergies) values (2, 'strawberries');
insert into Allergies (UserID, Allergies) values (3, 'kiwi');
insert into Allergies (UserID, Allergies) values (4, 'pineapple');
insert into Allergies (UserID, Allergies) values (5, 'avocado');
insert into Allergies (UserID, Allergies) values (6, 'mango');
insert into Allergies (UserID, Allergies) values (7, 'banana');
insert into Allergies (UserID, Allergies) values (8, 'tomato');
insert into Allergies (UserID, Allergies) values (9, 'peas');
insert into Allergies (UserID, Allergies) values (10, 'carrots');

# Recipe
DELETE From CookerDatabase.Recipe;
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (1, 'Croissant', 283, 16, 0, 1, 91137, 'Step 1 Preheat oven Step 2 Grease baking pan Step 3 Mix flour and sugar Step 4 Add eggs and milk Step 5 Beat until smooth Step 6 Pour batter into pan Step 7 Bake for 30 minutes Step 8 Let cool Step 9 Slice and serve', 'Greek', '2011-10-28');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (2, 'Ramen', 269, 124, 1, 1, 19189, 'Step 1 Preheat grill Step 2 Marinate chicken in spices Step 3 Grill chicken until cooked through Step 4 Toast buns Step 5 Assemble sandwiches with chicken lettuce and sauce Step 6 Serve with fries', 'Celtic', '2000-03-13');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (3, 'Sushi', 263, 194, 1, 1, 99500, 'Step 1 Preheat skillet Step 2 Cook ground beef until browned Step 3 Drain excess fat Step 4 Add taco seasoning Step 5 Stir in beans and salsa Step 6 Simmer for 10 minutes Step 7 Serve with tortilla chips', 'Zulu', '2005-10-06');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (4, 'Salad', 423, 248, 1, 0, 7711, 'Step 1 Heat oil in pan Step 2 Add chopped onions Step 3 Sauté until golden Step 4 Add diced tomatoes Step 5 Cook for 5 minutes Step 6 Stir in spices Step 7 Add cooked beans Step 8 Simmer for 10 minutes Step 9 Serve with rice', 'Mayan', '1999-08-25');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (5, 'Salad', 396, 247, 1, 0, 58428, 'Step 1 Cook rice according to package instructions Step 2 Heat oil in pan Step 3 Sauté chopped vegetables Step 4 Stir in cooked rice Step 5 Add soy sauce Step 6 Mix well Step 7 Garnish with green onions Step 8 Serve hot', 'Egyptian', '2021-04-22');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (6, 'Hot Dog', 101, 134, 0, 1, 97583, 'Step 1 Heat oil in pan Step 2 Add chopped onions Step 3 Sauté until golden Step 4 Add diced tomatoes Step 5 Cook for 5 minutes Step 6 Stir in spices Step 7 Add cooked beans Step 8 Simmer for 10 minutes Step 9 Serve with rice', 'Babylonian', '2013-04-28');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (7, 'Salad', 93, 146, 0, 1, 9545, 'Step 1 Preheat waffle iron Step 2 Mix flour baking powder and sugar Step 3 Beat eggs and milk Step 4 Stir into dry ingredients Step 5 Pour batter onto waffle iron Step 6 Cook until golden brown Step 7 Serve with maple syrup', 'Viking', '2009-10-20');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (8, 'Cannoli', 341, 278, 1, 0, 46699, 'Step 1 Preheat skillet Step 2 Cook ground beef until browned Step 3 Drain excess fat Step 4 Add taco seasoning Step 5 Stir in beans and salsa Step 6 Simmer for 10 minutes Step 7 Serve with tortilla chips', 'Greek', '2002-06-02');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (9, 'Macarons', 47, 3, 0, 0, 69587, 'Step 1 Heat oil in pan Step 2 Add chopped onions Step 3 Sauté until golden Step 4 Add diced tomatoes Step 5 Cook for 5 minutes Step 6 Stir in spices Step 7 Add cooked beans Step 8 Simmer for 10 minutes Step 9 Serve with rice', 'Maori', '2017-06-02');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (10, 'Sushi', 409, 242, 0, 1, 9447, 'Step 1 Preheat oven Step 2 Grease cake pans Step 3 Cream butter and sugar Step 4 Beat in eggs Step 5 Add flour and milk alternately Step 6 Stir in vanilla extract Step 7 Divide batter into pans Step 8 Bake for 25 minutes Step 9 Let cool Step 10 Frost and decorate as desired', 'Celtic', '2014-10-19');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (11, 'Burger', 53, 267, 1, 1, 88731, 'Step 1 Boil water Step 2 Add pasta Step 3 Cook until al dente Step 4 Drain pasta Step 5 Mix with sauce Step 6 Serve hot', 'Aboriginal', '2008-10-05');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (12, 'Cannoli', 180, 282, 1, 0, 74966, 'Step 1 Boil potatoes Step 2 Mash until smooth Step 3 Add butter and milk Step 4 Mix until creamy Step 5 Season with salt and pepper Step 6 Garnish with chopped parsley Step 7 Serve as a side dish', 'Maori', '2009-07-31');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (13, 'Bagel', 155, 67, 0, 0, 67235, 'Step 1 Boil water Step 2 Blanch broccoli Step 3 Sauté garlic in olive oil Step 4 Add cooked pasta and broccoli Step 5 Toss with grated cheese Step 6 Serve with crusty bread', 'Azande', '2017-04-24');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (14, 'Pad Thai', 131, 8, 1, 0, 72557, 'Step 1 Cook rice according to package instructions Step 2 Heat oil in pan Step 3 Sauté chopped vegetables Step 4 Stir in cooked rice Step 5 Add soy sauce Step 6 Mix well Step 7 Garnish with green onions Step 8 Serve hot', 'Norse', '2000-03-05');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (15, 'Cupcakes', 425, 258, 1, 0, 98135, 'Step 1 Boil water Step 2 Blanch broccoli Step 3 Sauté garlic in olive oil Step 4 Add cooked pasta and broccoli Step 5 Toss with grated cheese Step 6 Serve with crusty bread', 'Roman', '2015-10-06');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (16, 'Fried Chicken', 17, 123, 0, 1, 38300, 'Step 1 Preheat waffle iron Step 2 Mix flour baking powder and sugar Step 3 Beat eggs and milk Step 4 Stir into dry ingredients Step 5 Pour batter onto waffle iron Step 6 Cook until golden brown Step 7 Serve with maple syrup', 'Inuit', '2002-05-16');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (17, 'Sushi', 444, 22, 1, 1, 57534, 'Step 1 Boil water Step 2 Blanch broccoli Step 3 Sauté garlic in olive oil Step 4 Add cooked pasta and broccoli Step 5 Toss with grated cheese Step 6 Serve with crusty bread', 'Maori', '2012-07-12');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (18, 'Baklava', 395, 202, 0, 1, 17537, 'Step 1 Boil potatoes Step 2 Mash until smooth Step 3 Add butter and milk Step 4 Mix until creamy Step 5 Season with salt and pepper Step 6 Garnish with chopped parsley Step 7 Serve as a side dish', 'Maori', '2002-03-26');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (19, 'Pasta', 28, 213, 1, 0, 66906, 'Step 1 Preheat grill Step 2 Marinate chicken in spices Step 3 Grill chicken until cooked through Step 4 Toast buns Step 5 Assemble sandwiches with chicken lettuce and sauce Step 6 Serve with fries', 'Aztec', '1999-05-31');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (20, 'Mashed Potatoes', 250, 50, 0, 1, 78304, 'Step 1 Boil potatoes Step 2 Mash until smooth Step 3 Add butter and milk Step 4 Mix until creamy Step 5 Season with salt and pepper Step 6 Garnish with chopped parsley Step 7 Serve as a side dish', 'Aztec', '2009-02-03');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (21, 'Muffin', 266, 241, 0, 0, 57609, 'Step 1 Preheat waffle iron Step 2 Mix flour baking powder and sugar Step 3 Beat eggs and milk Step 4 Stir into dry ingredients Step 5 Pour batter onto waffle iron Step 6 Cook until golden brown Step 7 Serve with maple syrup', 'Egyptian', '2001-03-08');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (22, 'Cupcakes', 398, 82, 0, 1, 5906, 'Step 1 Preheat grill Step 2 Marinate chicken in spices Step 3 Grill chicken until cooked through Step 4 Toast buns Step 5 Assemble sandwiches with chicken lettuce and sauce Step 6 Serve with fries', 'Sumerian', '2019-04-23');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (23, 'Ice Cream', 377, 212, 1, 0, 60773, 'Step 1 Preheat skillet Step 2 Cook ground beef until browned Step 3 Drain excess fat Step 4 Add taco seasoning Step 5 Stir in beans and salsa Step 6 Simmer for 10 minutes Step 7 Serve with tortilla chips', 'Aztec', '2004-10-30');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (24, 'Pad Thai', 87, 147, 0, 0, 78124, 'Step 1 Heat oil in pan Step 2 Add chopped onions Step 3 Sauté until golden Step 4 Add diced tomatoes Step 5 Cook for 5 minutes Step 6 Stir in spices Step 7 Add cooked beans Step 8 Simmer for 10 minutes Step 9 Serve with rice', 'Zulu', '2008-05-31');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (25, 'Tiramisu', 268, 232, 0, 0, 99461, 'Step 1 Preheat waffle iron Step 2 Mix flour baking powder and sugar Step 3 Beat eggs and milk Step 4 Stir into dry ingredients Step 5 Pour batter onto waffle iron Step 6 Cook until golden brown Step 7 Serve with maple syrup', 'Persian', '2006-09-16');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (26, 'Salad', 432, 135, 1, 1, 31402, 'Step 1 Preheat oven Step 2 Grease baking pan Step 3 Mix flour and sugar Step 4 Add eggs and milk Step 5 Beat until smooth Step 6 Pour batter into pan Step 7 Bake for 30 minutes Step 8 Let cool Step 9 Slice and serve', 'Greek', '2009-06-30');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (27, 'Enchiladas', 105, 241, 0, 0, 44668, 'Step 1 Boil water Step 2 Add pasta Step 3 Cook until al dente Step 4 Drain pasta Step 5 Mix with sauce Step 6 Serve hot', 'Tibetan', '2010-05-09');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (28, 'Falafel', 330, 173, 0, 0, 60856, 'Step 1 Boil water Step 2 Add pasta Step 3 Cook until al dente Step 4 Drain pasta Step 5 Mix with sauce Step 6 Serve hot', 'Aztec', '2019-09-21');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (29, 'Nachos', 197, 84, 0, 0, 20336, 'Step 1 Preheat skillet Step 2 Cook ground beef until browned Step 3 Drain excess fat Step 4 Add taco seasoning Step 5 Stir in beans and salsa Step 6 Simmer for 10 minutes Step 7 Serve with tortilla chips', 'Mesoamerican', '2011-06-26');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (30, 'Cheesecake', 85, 279, 1, 1, 91962, 'Step 1 Boil water Step 2 Add pasta Step 3 Cook until al dente Step 4 Drain pasta Step 5 Mix with sauce Step 6 Serve hot', 'Indian', '2000-05-01');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (31, 'Enchiladas', 478, 265, 1, 1, 94079, 'Step 1 Boil water Step 2 Blanch broccoli Step 3 Sauté garlic in olive oil Step 4 Add cooked pasta and broccoli Step 5 Toss with grated cheese Step 6 Serve with crusty bread', 'Persian', '2005-12-24');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (32, 'Falafel', 115, 80, 1, 0, 35933, 'Step 1 Boil water Step 2 Blanch broccoli Step 3 Sauté garlic in olive oil Step 4 Add cooked pasta and broccoli Step 5 Toss with grated cheese Step 6 Serve with crusty bread', 'Japanese', '2001-04-16');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (33, 'Sushi', 85, 65, 1, 0, 81902, 'Step 1 Boil water Step 2 Blanch broccoli Step 3 Sauté garlic in olive oil Step 4 Add cooked pasta and broccoli Step 5 Toss with grated cheese Step 6 Serve with crusty bread', 'Tibetan', '2018-07-13');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (34, 'Muffin', 391, 272, 0, 1, 8826, 'Step 1 Preheat grill Step 2 Marinate chicken in spices Step 3 Grill chicken until cooked through Step 4 Toast buns Step 5 Assemble sandwiches with chicken lettuce and sauce Step 6 Serve with fries', 'Hawaiian', '2012-06-21');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (35, 'Pasta', 321, 176, 1, 1, 65071, 'Step 1 Preheat oven Step 2 Grease baking pan Step 3 Mix flour and sugar Step 4 Add eggs and milk Step 5 Beat until smooth Step 6 Pour batter into pan Step 7 Bake for 30 minutes Step 8 Let cool Step 9 Slice and serve', 'Iroquois', '2012-05-11');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (36, 'Gyro', 100, 157, 0, 1, 32770, 'Step 1 Boil water Step 2 Blanch broccoli Step 3 Sauté garlic in olive oil Step 4 Add cooked pasta and broccoli Step 5 Toss with grated cheese Step 6 Serve with crusty bread', 'Celtic', '1999-07-14');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (37, 'Fish and Chips', 284, 207, 0, 0, 31277, 'Step 1 Cook rice according to package instructions Step 2 Heat oil in pan Step 3 Sauté chopped vegetables Step 4 Stir in cooked rice Step 5 Add soy sauce Step 6 Mix well Step 7 Garnish with green onions Step 8 Serve hot', 'Chinese', '2009-11-16');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (38, 'Crab', 106, 161, 1, 1, 11085, 'Step 1 Preheat oven Step 2 Grease baking pan Step 3 Mix flour and sugar Step 4 Add eggs and milk Step 5 Beat until smooth Step 6 Pour batter into pan Step 7 Bake for 30 minutes Step 8 Let cool Step 9 Slice and serve', 'Mayan', '2001-05-11');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (39, 'Pasta', 126, 122, 0, 1, 48760, 'Step 1 Preheat oven Step 2 Grease cake pans Step 3 Cream butter and sugar Step 4 Beat in eggs Step 5 Add flour and milk alternately Step 6 Stir in vanilla extract Step 7 Divide batter into pans Step 8 Bake for 25 minutes Step 9 Let cool Step 10 Frost and decorate as desired', 'Babylonian', '2003-06-27');
insert into Recipe (RecipeID, Name, Cost, TimeToMake, LactoseFree, GlutenFree, Views, Steps, Culture, DateCreated) values (40, 'Hummus', 89, 25, 0, 0, 15716, 'Step 1 Preheat waffle iron Step 2 Mix flour baking powder and sugar Step 3 Beat eggs and milk Step 4 Stir into dry ingredients Step 5 Pour batter onto waffle iron Step 6 Cook until golden brown Step 7 Serve with maple syrup', 'Tibetan', '2007-02-26');

# Ingredients
DELETE From CookerDatabase.Ingredients;
insert into Ingredients (RecipeID, Ingredient) values (1, 'butter');
insert into Ingredients (RecipeID, Ingredient) values (2, 'ginger');
insert into Ingredients (RecipeID, Ingredient) values (3, 'thyme');
insert into Ingredients (RecipeID, Ingredient) values (4, 'nutmeg');
insert into Ingredients (RecipeID, Ingredient) values (5, 'olive oil');
insert into Ingredients (RecipeID, Ingredient) values (6, 'chickpeas');
insert into Ingredients (RecipeID, Ingredient) values (7, 'hot sauce');
insert into Ingredients (RecipeID, Ingredient) values (8, 'maple syrup');
insert into Ingredients (RecipeID, Ingredient) values (9, 'parsley');
insert into Ingredients (RecipeID, Ingredient) values (10, 'black beans');
insert into Ingredients (RecipeID, Ingredient) values (11, 'quinoa');
insert into Ingredients (RecipeID, Ingredient) values (12, 'pepper');
insert into Ingredients (RecipeID, Ingredient) values (13, 'cashews');
insert into Ingredients (RecipeID, Ingredient) values (14, 'flour');
insert into Ingredients (RecipeID, Ingredient) values (15, 'coriander');
insert into Ingredients (RecipeID, Ingredient) values (16, 'eggs');
insert into Ingredients (RecipeID, Ingredient) values (17, 'flour');
insert into Ingredients (RecipeID, Ingredient) values (18, 'sriracha');
insert into Ingredients (RecipeID, Ingredient) values (19, 'rosemary');
insert into Ingredients (RecipeID, Ingredient) values (20, 'barbecue sauce');
insert into Ingredients (RecipeID, Ingredient) values (21, 'vanilla extract');
insert into Ingredients (RecipeID, Ingredient) values (22, 'milk');
insert into Ingredients (RecipeID, Ingredient) values (23, 'lime');
insert into Ingredients (RecipeID, Ingredient) values (24, 'sunflower seeds');
insert into Ingredients (RecipeID, Ingredient) values (25, 'cashews');
insert into Ingredients (RecipeID, Ingredient) values (26, 'chocolate chips');
insert into Ingredients (RecipeID, Ingredient) values (27, 'lime');
insert into Ingredients (RecipeID, Ingredient) values (28, 'chickpeas');
insert into Ingredients (RecipeID, Ingredient) values (29, 'ginger');
insert into Ingredients (RecipeID, Ingredient) values (30, 'hot sauce');
insert into Ingredients (RecipeID, Ingredient) values (31, 'chickpeas');
insert into Ingredients (RecipeID, Ingredient) values (32, 'parsley');
insert into Ingredients (RecipeID, Ingredient) values (33, 'ginger');
insert into Ingredients (RecipeID, Ingredient) values (34, 'sugar');
insert into Ingredients (RecipeID, Ingredient) values (35, 'honey');
insert into Ingredients (RecipeID, Ingredient) values (36, 'maple syrup');
insert into Ingredients (RecipeID, Ingredient) values (37, 'walnuts');
insert into Ingredients (RecipeID, Ingredient) values (38, 'eggs');
insert into Ingredients (RecipeID, Ingredient) values (39, 'chia seeds');
insert into Ingredients (RecipeID, Ingredient) values (40, 'tomato');
insert into Ingredients (RecipeID, Ingredient) values (4, 'sunflower seeds');
insert into Ingredients (RecipeID, Ingredient) values (5, 'mayonnaise');
insert into Ingredients (RecipeID, Ingredient) values (6, 'cashews');
insert into Ingredients (RecipeID, Ingredient) values (7, 'paprika');
insert into Ingredients (RecipeID, Ingredient) values (8, 'basil');
insert into Ingredients (RecipeID, Ingredient) values (9, 'salt');
insert into Ingredients (RecipeID, Ingredient) values (10, 'parsley');
insert into Ingredients (RecipeID, Ingredient) values (11, 'barbecue sauce');
insert into Ingredients (RecipeID, Ingredient) values (12, 'honey');
insert into Ingredients (RecipeID, Ingredient) values (13, 'mustard');
insert into Ingredients (RecipeID, Ingredient) values (14, 'nutmeg');
insert into Ingredients (RecipeID, Ingredient) values (15, 'paprika');
insert into Ingredients (RecipeID, Ingredient) values (16, 'almonds');
insert into Ingredients (RecipeID, Ingredient) values (17, 'mustard');
insert into Ingredients (RecipeID, Ingredient) values (18, 'sunflower seeds');
insert into Ingredients (RecipeID, Ingredient) values (19, 'parsley');
insert into Ingredients (RecipeID, Ingredient) values (20, 'eggs');
insert into Ingredients (RecipeID, Ingredient) values (21, 'cumin');
insert into Ingredients (RecipeID, Ingredient) values (22, 'parsley');
insert into Ingredients (RecipeID, Ingredient) values (23, 'honey');
insert into Ingredients (RecipeID, Ingredient) values (24, 'vanilla extract');
insert into Ingredients (RecipeID, Ingredient) values (25, 'garlic');
insert into Ingredients (RecipeID, Ingredient) values (26, 'rice vinegar');
insert into Ingredients (RecipeID, Ingredient) values (27, 'thyme');
insert into Ingredients (RecipeID, Ingredient) values (28, 'onion');
insert into Ingredients (RecipeID, Ingredient) values (29, 'cinnamon');
insert into Ingredients (RecipeID, Ingredient) values (30, 'onion');
insert into Ingredients (RecipeID, Ingredient) values (31, 'olive oil');
insert into Ingredients (RecipeID, Ingredient) values (32, 'garlic');
insert into Ingredients (RecipeID, Ingredient) values (33, 'flour');
insert into Ingredients (RecipeID, Ingredient) values (34, 'cashews');
insert into Ingredients (RecipeID, Ingredient) values (35, 'chocolate chips');
insert into Ingredients (RecipeID, Ingredient) values (36, 'chia seeds');
insert into Ingredients (RecipeID, Ingredient) values (37, 'cumin');
insert into Ingredients (RecipeID, Ingredient) values (38, 'rosemary');
insert into Ingredients (RecipeID, Ingredient) values (39, 'milk');
insert into Ingredients (RecipeID, Ingredient) values (40, 'olive oil');
insert into Ingredients (RecipeID, Ingredient) values (1, 'tomato');
insert into Ingredients (RecipeID, Ingredient) values (2, 'cinnamon');
insert into Ingredients (RecipeID, Ingredient) values (3, 'black beans');
insert into Ingredients (RecipeID, Ingredient) values (4, 'mustard');
insert into Ingredients (RecipeID, Ingredient) values (5, 'coriander');
insert into Ingredients (RecipeID, Ingredient) values (6, 'cumin');
insert into Ingredients (RecipeID, Ingredient) values (7, 'sesame oil');
insert into Ingredients (RecipeID, Ingredient) values (8, 'nutmeg');
insert into Ingredients (RecipeID, Ingredient) values (9, 'worcestershire sauce');
insert into Ingredients (RecipeID, Ingredient) values (10, 'olive oil');
insert into Ingredients (RecipeID, Ingredient) values (11, 'nutmeg');
insert into Ingredients (RecipeID, Ingredient) values (12, 'ginger');
insert into Ingredients (RecipeID, Ingredient) values (13, 'honey');
insert into Ingredients (RecipeID, Ingredient) values (14, 'barbecue sauce');
insert into Ingredients (RecipeID, Ingredient) values (15, 'milk');
insert into Ingredients (RecipeID, Ingredient) values (16, 'basil');
insert into Ingredients (RecipeID, Ingredient) values (17, 'thyme');
insert into Ingredients (RecipeID, Ingredient) values (18, 'tomato');
insert into Ingredients (RecipeID, Ingredient) values (19, 'peanuts');
insert into Ingredients (RecipeID, Ingredient) values (20, 'lemon');
insert into Ingredients (RecipeID, Ingredient) values (21, 'paprika');
insert into Ingredients (RecipeID, Ingredient) values (22, 'coconut milk');
insert into Ingredients (RecipeID, Ingredient) values (23, 'worcestershire sauce');
insert into Ingredients (RecipeID, Ingredient) values (24, 'cumin');
insert into Ingredients (RecipeID, Ingredient) values (25, 'cinnamon');
insert into Ingredients (RecipeID, Ingredient) values (26, 'walnuts');
insert into Ingredients (RecipeID, Ingredient) values (27, 'mayonnaise');
insert into Ingredients (RecipeID, Ingredient) values (28, 'worcestershire sauce');
insert into Ingredients (RecipeID, Ingredient) values (29, 'hot sauce');
insert into Ingredients (RecipeID, Ingredient) values (30, 'maple syrup');
insert into Ingredients (RecipeID, Ingredient) values (31, 'hot sauce');
insert into Ingredients (RecipeID, Ingredient) values (32, 'basil');
insert into Ingredients (RecipeID, Ingredient) values (33, 'pepper');
insert into Ingredients (RecipeID, Ingredient) values (34, 'tomato');
insert into Ingredients (RecipeID, Ingredient) values (35, 'sunflower seeds');
insert into Ingredients (RecipeID, Ingredient) values (36, 'sriracha');
insert into Ingredients (RecipeID, Ingredient) values (37, 'coconut milk');
insert into Ingredients (RecipeID, Ingredient) values (38, 'worcestershire sauce');
insert into Ingredients (RecipeID, Ingredient) values (39, 'garlic');
insert into Ingredients (RecipeID, Ingredient) values (40, 'cinnamon');
insert into Ingredients (RecipeID, Ingredient) values (1, 'lemon');
insert into Ingredients (RecipeID, Ingredient) values (2, 'rosemary');
insert into Ingredients (RecipeID, Ingredient) values (3, 'hot sauce');
insert into Ingredients (RecipeID, Ingredient) values (4, 'rice vinegar');
insert into Ingredients (RecipeID, Ingredient) values (5, 'almonds');
insert into Ingredients (RecipeID, Ingredient) values (6, 'garlic');
insert into Ingredients (RecipeID, Ingredient) values (7, 'mayonnaise');
insert into Ingredients (RecipeID, Ingredient) values (8, 'tomato');
insert into Ingredients (RecipeID, Ingredient) values (9, 'milk');
insert into Ingredients (RecipeID, Ingredient) values (10, 'ketchup');
insert into Ingredients (RecipeID, Ingredient) values (11, 'black beans');
insert into Ingredients (RecipeID, Ingredient) values (12, 'flax seeds');
insert into Ingredients (RecipeID, Ingredient) values (13, 'lime');
insert into Ingredients (RecipeID, Ingredient) values (14, 'cashews');
insert into Ingredients (RecipeID, Ingredient) values (15, 'ketchup');
insert into Ingredients (RecipeID, Ingredient) values (16, 'paprika');
insert into Ingredients (RecipeID, Ingredient) values (17, 'milk');
insert into Ingredients (RecipeID, Ingredient) values (18, 'mayonnaise');
insert into Ingredients (RecipeID, Ingredient) values (19, 'mustard');
insert into Ingredients (RecipeID, Ingredient) values (20, 'baking powder');
insert into Ingredients (RecipeID, Ingredient) values (21, 'worcestershire sauce');
insert into Ingredients (RecipeID, Ingredient) values (22, 'chocolate chips');
insert into Ingredients (RecipeID, Ingredient) values (23, 'eggs');
insert into Ingredients (RecipeID, Ingredient) values (24, 'lime');
insert into Ingredients (RecipeID, Ingredient) values (25, 'parsley');
insert into Ingredients (RecipeID, Ingredient) values (26, 'sesame oil');
insert into Ingredients (RecipeID, Ingredient) values (27, 'rosemary');
insert into Ingredients (RecipeID, Ingredient) values (28, 'coriander');
insert into Ingredients (RecipeID, Ingredient) values (29, 'cashews');
insert into Ingredients (RecipeID, Ingredient) values (30, 'sesame oil');
insert into Ingredients (RecipeID, Ingredient) values (31, 'worcestershire sauce');
insert into Ingredients (RecipeID, Ingredient) values (32, 'cinnamon');
insert into Ingredients (RecipeID, Ingredient) values (33, 'soy sauce');
insert into Ingredients (RecipeID, Ingredient) values (34, 'ginger');
insert into Ingredients (RecipeID, Ingredient) values (35, 'vanilla extract');
insert into Ingredients (RecipeID, Ingredient) values (36, 'black beans');
insert into Ingredients (RecipeID, Ingredient) values (38, 'soy sauce');
insert into Ingredients (RecipeID, Ingredient) values (39, 'olive oil');
insert into Ingredients (RecipeID, Ingredient) values (40, 'rosemary');

# Favourites
DELETE FROM CookerDatabase.Favourites;
insert into Favourites (UserID, FavouriteRecipe) values (1, 11);
insert into Favourites (UserID, FavouriteRecipe) values (2, 1);
insert into Favourites (UserID, FavouriteRecipe) values (3, 32);
insert into Favourites (UserID, FavouriteRecipe) values (4, 36);
insert into Favourites (UserID, FavouriteRecipe) values (5, 8);
insert into Favourites (UserID, FavouriteRecipe) values (6, 7);
insert into Favourites (UserID, FavouriteRecipe) values (7, 20);
insert into Favourites (UserID, FavouriteRecipe) values (8, 8);
insert into Favourites (UserID, FavouriteRecipe) values (9, 18);
insert into Favourites (UserID, FavouriteRecipe) values (10, 8);
insert into Favourites (UserID, FavouriteRecipe) values (11, 29);
insert into Favourites (UserID, FavouriteRecipe) values (12, 37);
insert into Favourites (UserID, FavouriteRecipe) values (13, 40);
insert into Favourites (UserID, FavouriteRecipe) values (14, 30);
insert into Favourites (UserID, FavouriteRecipe) values (15, 2);
insert into Favourites (UserID, FavouriteRecipe) values (16, 12);
insert into Favourites (UserID, FavouriteRecipe) values (17, 20);
insert into Favourites (UserID, FavouriteRecipe) values (18, 31);
insert into Favourites (UserID, FavouriteRecipe) values (19, 9);
insert into Favourites (UserID, FavouriteRecipe) values (20, 29);
insert into Favourites (UserID, FavouriteRecipe) values (21, 31);
insert into Favourites (UserID, FavouriteRecipe) values (22, 13);
insert into Favourites (UserID, FavouriteRecipe) values (23, 31);
insert into Favourites (UserID, FavouriteRecipe) values (24, 31);
insert into Favourites (UserID, FavouriteRecipe) values (25, 19);
insert into Favourites (UserID, FavouriteRecipe) values (26, 29);
insert into Favourites (UserID, FavouriteRecipe) values (27, 12);
insert into Favourites (UserID, FavouriteRecipe) values (28, 19);
insert into Favourites (UserID, FavouriteRecipe) values (29, 14);
insert into Favourites (UserID, FavouriteRecipe) values (30, 26);
insert into Favourites (UserID, FavouriteRecipe) values (31, 6);
insert into Favourites (UserID, FavouriteRecipe) values (32, 1);
insert into Favourites (UserID, FavouriteRecipe) values (33, 38);
insert into Favourites (UserID, FavouriteRecipe) values (34, 11);
insert into Favourites (UserID, FavouriteRecipe) values (35, 7);
insert into Favourites (UserID, FavouriteRecipe) values (36, 14);
insert into Favourites (UserID, FavouriteRecipe) values (37, 7);
insert into Favourites (UserID, FavouriteRecipe) values (38, 10);
insert into Favourites (UserID, FavouriteRecipe) values (39, 23);
insert into Favourites (UserID, FavouriteRecipe) values (40, 19);
insert into Favourites (UserID, FavouriteRecipe) values (1, 22);
insert into Favourites (UserID, FavouriteRecipe) values (2, 40);
insert into Favourites (UserID, FavouriteRecipe) values (3, 3);
insert into Favourites (UserID, FavouriteRecipe) values (4, 20);
insert into Favourites (UserID, FavouriteRecipe) values (5, 21);
insert into Favourites (UserID, FavouriteRecipe) values (6, 18);
insert into Favourites (UserID, FavouriteRecipe) values (7, 39);
insert into Favourites (UserID, FavouriteRecipe) values (8, 26);
insert into Favourites (UserID, FavouriteRecipe) values (9, 30);
insert into Favourites (UserID, FavouriteRecipe) values (10, 15);
insert into Favourites (UserID, FavouriteRecipe) values (11, 8);
insert into Favourites (UserID, FavouriteRecipe) values (12, 40);
insert into Favourites (UserID, FavouriteRecipe) values (13, 22);
insert into Favourites (UserID, FavouriteRecipe) values (14, 2);
insert into Favourites (UserID, FavouriteRecipe) values (15, 7);
insert into Favourites (UserID, FavouriteRecipe) values (16, 2);
insert into Favourites (UserID, FavouriteRecipe) values (17, 25);
insert into Favourites (UserID, FavouriteRecipe) values (18, 25);
insert into Favourites (UserID, FavouriteRecipe) values (19, 16);
insert into Favourites (UserID, FavouriteRecipe) values (20, 34);
insert into Favourites (UserID, FavouriteRecipe) values (21, 40);
insert into Favourites (UserID, FavouriteRecipe) values (22, 30);
insert into Favourites (UserID, FavouriteRecipe) values (23, 38);
insert into Favourites (UserID, FavouriteRecipe) values (24, 26);
insert into Favourites (UserID, FavouriteRecipe) values (25, 18);
insert into Favourites (UserID, FavouriteRecipe) values (26, 36);
insert into Favourites (UserID, FavouriteRecipe) values (27, 36);
insert into Favourites (UserID, FavouriteRecipe) values (28, 27);
insert into Favourites (UserID, FavouriteRecipe) values (29, 34);
insert into Favourites (UserID, FavouriteRecipe) values (30, 15);
insert into Favourites (UserID, FavouriteRecipe) values (32, 28);
insert into Favourites (UserID, FavouriteRecipe) values (33, 8);
insert into Favourites (UserID, FavouriteRecipe) values (34, 16);
insert into Favourites (UserID, FavouriteRecipe) values (35, 37);
insert into Favourites (UserID, FavouriteRecipe) values (36, 11);
insert into Favourites (UserID, FavouriteRecipe) values (37, 39);
insert into Favourites (UserID, FavouriteRecipe) values (38, 36);
insert into Favourites (UserID, FavouriteRecipe) values (39, 34);
insert into Favourites (UserID, FavouriteRecipe) values (40, 21);
insert into Favourites (UserID, FavouriteRecipe) values (2, 29);
insert into Favourites (UserID, FavouriteRecipe) values (4, 12);
insert into Favourites (UserID, FavouriteRecipe) values (5, 1);
insert into Favourites (UserID, FavouriteRecipe) values (6, 13);
insert into Favourites (UserID, FavouriteRecipe) values (7, 10);
insert into Favourites (UserID, FavouriteRecipe) values (8, 9);
insert into Favourites (UserID, FavouriteRecipe) values (9, 4);
insert into Favourites (UserID, FavouriteRecipe) values (10, 11);
insert into Favourites (UserID, FavouriteRecipe) values (11, 34);
insert into Favourites (UserID, FavouriteRecipe) values (12, 30);
insert into Favourites (UserID, FavouriteRecipe) values (13, 33);
insert into Favourites (UserID, FavouriteRecipe) values (14, 28);
insert into Favourites (UserID, FavouriteRecipe) values (15, 37);
insert into Favourites (UserID, FavouriteRecipe) values (16, 11);
insert into Favourites (UserID, FavouriteRecipe) values (17, 4);
insert into Favourites (UserID, FavouriteRecipe) values (18, 18);
insert into Favourites (UserID, FavouriteRecipe) values (19, 39);
insert into Favourites (UserID, FavouriteRecipe) values (20, 38);

# Comment
DELETE FROM CookerDatabase.Comment;
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (1, 1, 1, 'I''m not a fan of this recipe.', 'Ronalda Berrane', 865, '2023-07-08');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (2, 2, 3, 'I''m not a fan of this recipe.', 'Durant Carmel', 172, '2023-02-01');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (3, 3, 28, 'I won''t be making it again.', 'Hy Hanny', 774, '2022-11-18');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (4, 4, 33, 'This recipe was delicious!', 'Stillman Takle', 962, '2023-12-21');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (5, 5, 40, 'The flavors were a bit bland for my taste.', 'Fanya Huygen', 852, '2023-10-01');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (6, 6, 19, 'I added extra garlic and it turned out amazing.', 'Hunfredo Stinton', 692, '2023-09-06');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (7, 7, 30, 'The flavors were a bit bland for my taste.', 'Bekki Bothbie', 87, '2022-11-24');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (8, 8, 7, 'The flavors were a bit bland for my taste.', 'Colman Abrey', 232, '2023-08-19');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (9, 9, 25, 'This recipe was delicious!', 'Melissa Bumfrey', 658, '2022-10-22');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (10, 10, 11, 'The flavors were a bit bland for my taste.', 'Walton Luetchford', 525, '2023-09-20');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (11, 11, 3, 'The cooking instructions were easy to follow.', 'Merralee McDool', 292, '2023-11-26');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (12, 12, 31, 'I think I''ll try adding some spice next time.', 'Lisha Haggish', 230, '2023-11-26');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (13, 13, 15, 'My family loved this dish.', 'Eduardo Cowper', 265, '2023-04-28');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (14, 14, 34, 'I wish I had used less salt in this recipe.', 'Werner Waind', 529, '2024-03-18');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (15, 15, 10, 'I think I''ll try adding some spice next time.', 'Rorie Gaitskill', 335, '2024-01-30');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (16, 16, 20, 'The cooking time was longer than expected.', 'Willi Llywarch', 627, '2022-11-10');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (17, 17, 10, 'I added extra garlic and it turned out amazing.', 'Sayre Upward', 970, '2023-06-13');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (18, 18, 28, 'I won''t be making it again.', 'Allyn Scimonelli', 276, '2023-06-25');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (19, 19, 26, 'I recommend serving this with a side of rice.', 'Ole Drakes', 457, '2024-01-17');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (20, 20, 17, 'I think this recipe would be better with more vegetables.', 'Andie Treneer', 458, '2023-11-25');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (21, 21, 3, 'I added extra garlic and it turned out amazing.', 'Umeko Hanhardt', 206, '2023-09-22');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (22, 22, 39, 'The cooking instructions were easy to follow.', 'Isacco Cooke', 402, '2024-01-12');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (23, 23, 21, 'I recommend serving this with a side of rice.', 'Vaughan Olford', 293, '2024-02-08');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (24, 24, 23, 'I burned the sauce while making this recipe.', 'Lin Dougherty', 239, '2023-04-10');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (25, 25, 19, 'I added extra garlic and it turned out amazing.', 'Moss Coot', 29, '2024-03-29');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (26, 26, 23, 'I substituted the chicken for tofu and it worked well.', 'Charleen Orford', 922, '2023-11-04');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (27, 27, 17, 'The cooking instructions were easy to follow.', 'Cord Bolzmann', 734, '2022-12-04');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (28, 28, 2, 'This dish was a hit at my dinner party.', 'Elyn Witherspoon', 343, '2024-01-27');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (29, 29, 20, 'I think I''ll try adding some spice next time.', 'Jamaal Marzelo', 265, '2024-01-11');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (30, 30, 29, 'I burned the sauce while making this recipe.', 'Demetrius Craister', 467, '2023-09-16');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (31, 31, 36, 'The presentation of this dish was beautiful.', 'Merlina Dows', 984, '2023-06-16');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (32, 32, 3, 'The recipe was missing a key ingredient.', 'Aron Terbruggen', 335, '2022-10-24');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (33, 33, 31, 'This recipe was a disaster', 'Caterina Voyce', 685, '2023-11-07');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (34, 34, 25, 'I think I''ll try adding some spice next time.', 'Grace Kieran', 693, '2023-10-08');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (35, 35, 38, 'I''m not a fan of this recipe.', 'Lucie MacDwyer', 368, '2023-01-31');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (36, 36, 3, 'The presentation of this dish was beautiful.', 'Juana Kirkbright', 306, '2023-08-17');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (37, 37, 16, 'I overcooked the pasta in this recipe.', 'Magdalene Waterstone', 674, '2023-08-28');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (38, 38, 15, 'The cooking time was longer than expected.', 'Nicolis Dolton', 725, '2023-05-23');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (39, 39, 22, 'I added extra garlic and it turned out amazing.', 'Lemmy Skewes', 798, '2024-02-29');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (40, 40, 30, 'I will definitely make this again.', 'Aime Antoniewicz', 755, '2024-03-03');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (1, 41, 31, 'The cooking instructions were easy to follow.', 'Ronalda Berrane', 640, '2023-03-09');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (2, 42, 24, 'My family loved this dish.', 'Durant Carmel', 686, '2023-08-29');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (3, 43, 22, 'I wish I had used less salt in this recipe.', 'Hy Hanny', 343, '2023-08-30');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (4, 44, 10, 'The cooking instructions were easy to follow.', 'Stillman Takle', 207, '2023-05-27');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (5, 45, 4, 'The cooking instructions were easy to follow.', 'Fanya Huygen', 944, '2023-11-15');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (6, 46, 11, 'This recipe was delicious!', 'Hunfredo Stinton', 673, '2023-12-21');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (7, 47, 2, 'I added extra garlic and it turned out amazing.', 'Bekki Bothbie', 52, '2022-12-23');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (8, 48, 16, 'I''m not a fan of this recipe.', 'Colman Abrey', 923, '2023-07-22');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (9, 49, 37, 'I think I''ll try adding some spice next time.', 'Melissa Bumfrey', 951, '2024-03-15');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (10, 50, 38, 'This recipe was a disaster', 'Walton Luetchford', 6, '2023-05-21');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (11, 51, 6, 'I won''t be making it again.', 'Merralee McDool', 567, '2023-03-30');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (12, 52, 40, 'I substituted the chicken for tofu and it worked well.', 'Lisha Haggish', 400, '2022-12-23');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (13, 53, 24, 'I think I''ll try adding some spice next time.', 'Eduardo Cowper', 223, '2023-08-13');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (14, 54, 6, 'I overcooked the pasta in this recipe.', 'Werner Waind', 694, '2023-01-06');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (15, 55, 18, 'I''m not a fan of this recipe.', 'Rorie Gaitskill', 821, '2023-11-26');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (16, 56, 10, 'The flavors were a bit bland for my taste.', 'Willi Llywarch', 698, '2023-03-29');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (17, 57, 10, 'I burned the sauce while making this recipe.', 'Sayre Upward', 182, '2023-09-08');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (18, 58, 29, 'This recipe was delicious!', 'Allyn Scimonelli', 694, '2023-01-10');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (19, 59, 16, 'I added extra garlic and it turned out amazing.', 'Ole Drakes', 3, '2024-04-13');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (20, 60, 36, 'This dish was a hit at my dinner party.', 'Andie Treneer', 862, '2024-02-21');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (21, 61, 14, 'My family loved this dish.', 'Umeko Hanhardt', 820, '2023-06-01');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (22, 62, 2, 'This recipe was a disaster', 'Isacco Cooke', 238, '2023-03-18');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (23, 63, 25, 'I recommend serving this with a side of rice.', 'Vaughan Olford', 797, '2023-06-11');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (24, 64, 19, 'I overcooked the pasta in this recipe.', 'Lin Dougherty', 512, '2023-04-19');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (25, 65, 16, 'I will be making this for my next potluck.', 'Moss Coot', 286, '2023-03-11');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (26, 66, 10, 'I think this recipe would be better with more vegetables.', 'Charleen Orford', 762, '2024-03-23');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (27, 67, 10, 'I substituted the chicken for tofu and it worked well.', 'Cord Bolzmann', 692, '2022-12-24');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (28, 68, 11, 'The flavors were a bit bland for my taste.', 'Elyn Witherspoon', 828, '2023-09-15');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (29, 69, 20, 'I recommend serving this with a side of rice.', 'Jamaal Marzelo', 881, '2023-09-12');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (30, 70, 8, 'This dish was a hit at my dinner party.', 'Demetrius Craister', 566, '2023-07-23');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (31, 71, 12, 'This recipe was delicious!', 'Merlina Dows', 893, '2023-10-11');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (32, 72, 22, 'I added extra garlic and it turned out amazing.', 'Aron Terbruggen', 63, '2023-03-07');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (33, 73, 2, 'I think this recipe would be better with more vegetables.', 'Caterina Voyce', 264, '2023-12-13');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (34, 74, 14, 'I burned the sauce while making this recipe.', 'Grace Kieran', 551, '2022-11-16');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (35, 75, 28, 'I won''t be making it again.', 'Lucie MacDwyer', 943, '2023-06-09');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (36, 76, 22, 'This recipe was a disaster', 'Juana Kirkbright', 842, '2022-10-27');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (37, 77, 35, 'I won''t be making it again.', 'Magdalene Waterstone', 931, '2023-04-15');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (38, 78, 21, 'I recommend serving this with a side of rice.', 'Nicolis Dolton', 904, '2023-10-08');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (39, 79, 11, 'I burned the sauce while making this recipe.', 'Lemmy Skewes', 773, '2022-11-05');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (40, 80, 34, 'The presentation of this dish was beautiful.', 'Aime Antoniewicz', 405, '2023-05-07');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (1, 81, 35, 'I burned the sauce while making this recipe.', 'Ronalda Berrane', 632, '2023-03-26');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (2, 82, 1, 'I think I''ll try adding some spice next time.', 'Durant Carmel', 376, '2023-08-29');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (3, 83, 20, 'This dish was a hit at my dinner party.', 'Hy Hanny', 340, '2023-09-01');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (4, 84, 16, 'This recipe was a disaster', 'Stillman Takle', 715, '2024-02-24');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (5, 85, 17, 'This recipe was delicious!', 'Fanya Huygen', 426, '2023-06-21');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (6, 86, 18, 'This recipe was delicious!', 'Hunfredo Stinton', 668, '2023-12-07');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (7, 87, 4, 'This recipe was a disaster', 'Bekki Bothbie', 537, '2022-11-07');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (8, 88, 9, 'I wish I had used less salt in this recipe.', 'Colman Abrey', 871, '2024-02-08');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (9, 89, 39, 'This recipe was a disaster', 'Melissa Bumfrey', 145, '2023-06-10');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (10, 90, 22, 'I won''t be making it again.', 'Walton Luetchford', 930, '2024-01-05');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (11, 91, 33, 'The cooking time was longer than expected.', 'Merralee McDool', 934, '2023-09-25');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (12, 92, 18, 'The recipe was missing a key ingredient.', 'Lisha Haggish', 358, '2023-05-16');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (13, 93, 12, 'I wish I had used less salt in this recipe.', 'Eduardo Cowper', 655, '2023-02-22');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (14, 94, 32, 'This dish was a hit at my dinner party.', 'Werner Waind', 462, '2023-04-23');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (15, 95, 25, 'I will definitely make this again.', 'Rorie Gaitskill', 105, '2023-04-04');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (16, 96, 1, 'I won''t be making it again.', 'Willi Llywarch', 112, '2023-10-09');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (17, 97, 29, 'The flavors were a bit bland for my taste.', 'Sayre Upward', 313, '2023-05-23');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (18, 98, 40, 'I wish I had used less salt in this recipe.', 'Allyn Scimonelli', 53, '2023-10-05');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (19, 99, 22, 'The cooking instructions were easy to follow.', 'Ole Drakes', 819, '2024-04-16');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (20, 100, 38, 'I overcooked the pasta in this recipe.', 'Andie Treneer', 63, '2023-01-06');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (21, 101, 34, 'The presentation of this dish was beautiful.', 'Umeko Hanhardt', 401, '2023-01-07');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (22, 102, 18, 'I overcooked the pasta in this recipe.', 'Isacco Cooke', 152, '2023-08-08');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (23, 103, 13, 'The presentation of this dish was beautiful.', 'Vaughan Olford', 151, '2023-04-25');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (24, 104, 26, 'I will be making this for my next potluck.', 'Lin Dougherty', 578, '2023-11-09');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (25, 105, 38, 'My family loved this dish.', 'Moss Coot', 288, '2023-07-20');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (26, 106, 22, 'The flavors were a bit bland for my taste.', 'Charleen Orford', 81, '2023-09-21');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (27, 107, 39, 'I think this recipe would be better with more vegetables.', 'Cord Bolzmann', 513, '2023-04-30');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (28, 108, 4, 'This recipe was delicious!', 'Elyn Witherspoon', 872, '2023-03-10');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (29, 109, 27, 'The recipe was missing a key ingredient.', 'Jamaal Marzelo', 795, '2023-10-07');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (30, 110, 5, 'The recipe was missing a key ingredient.', 'Demetrius Craister', 476, '2023-11-19');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (31, 111, 29, 'The cooking instructions were easy to follow.', 'Merlina Dows', 944, '2023-10-10');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (32, 112, 26, 'I won''t be making it again.', 'Aron Terbruggen', 514, '2023-10-23');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (33, 113, 30, 'I won''t be making it again.', 'Caterina Voyce', 499, '2023-08-19');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (34, 114, 3, 'I added extra garlic and it turned out amazing.', 'Grace Kieran', 976, '2023-02-18');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (35, 115, 30, 'I added extra garlic and it turned out amazing.', 'Lucie MacDwyer', 95, '2022-11-14');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (36, 116, 11, 'The presentation of this dish was beautiful.', 'Juana Kirkbright', 206, '2024-01-06');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (37, 117, 5, 'My family loved this dish.', 'Magdalene Waterstone', 99, '2022-12-22');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (38, 118, 9, 'I substituted the chicken for tofu and it worked well.', 'Nicolis Dolton', 782, '2023-04-09');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (39, 119, 30, 'The flavors were a bit bland for my taste.', 'Lemmy Skewes', 598, '2022-11-11');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (40, 120, 16, 'I won''t be making it again.', 'Aime Antoniewicz', 970, '2023-03-12');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (1, 121, 32, 'I will be making this for my next potluck.', 'Ronalda Berrane', 474, '2024-02-17');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (2, 122, 32, 'I burned the sauce while making this recipe.', 'Durant Carmel', 390, '2023-04-19');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (3, 123, 7, 'This recipe was delicious!', 'Hy Hanny', 599, '2022-11-04');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (4, 124, 9, 'I think this recipe would be better with more vegetables.', 'Stillman Takle', 994, '2023-12-07');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (5, 125, 35, 'I''m not a fan of this recipe.', 'Fanya Huygen', 85, '2023-06-14');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (6, 126, 26, 'I added extra garlic and it turned out amazing.', 'Hunfredo Stinton', 519, '2023-06-18');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (7, 127, 30, 'My family loved this dish.', 'Bekki Bothbie', 714, '2022-11-28');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (8, 128, 14, 'I won''t be making it again.', 'Colman Abrey', 530, '2023-11-02');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (9, 129, 17, 'My family loved this dish.', 'Melissa Bumfrey', 235, '2022-12-30');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (10, 130, 18, 'I wish I had used less salt in this recipe.', 'Walton Luetchford', 662, '2024-02-25');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (11, 131, 32, 'I added extra garlic and it turned out amazing.', 'Merralee McDool', 742, '2023-07-08');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (12, 132, 14, 'The recipe was missing a key ingredient.', 'Lisha Haggish', 992, '2023-05-30');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (13, 133, 1, 'My family loved this dish.', 'Eduardo Cowper', 873, '2024-01-13');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (14, 134, 9, 'The cooking instructions were easy to follow.', 'Werner Waind', 571, '2023-05-14');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (15, 135, 1, 'This recipe was a disaster', 'Rorie Gaitskill', 269, '2023-02-04');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (16, 136, 18, 'This dish was a hit at my dinner party.', 'Willi Llywarch', 196, '2023-04-17');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (17, 137, 1, 'The cooking instructions were easy to follow.', 'Sayre Upward', 39, '2022-10-28');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (18, 138, 5, 'I will be making this for my next potluck.', 'Allyn Scimonelli', 341, '2023-03-03');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (19, 139, 39, 'The recipe was missing a key ingredient.', 'Ole Drakes', 766, '2023-06-27');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (20, 140, 13, 'I added extra garlic and it turned out amazing.', 'Andie Treneer', 43, '2024-02-22');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (21, 141, 32, 'I burned the sauce while making this recipe.', 'Umeko Hanhardt', 803, '2023-10-11');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (22, 142, 23, 'I won''t be making it again.', 'Isacco Cooke', 872, '2022-11-26');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (23, 143, 39, 'I wish I had used less salt in this recipe.', 'Vaughan Olford', 692, '2023-05-01');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (24, 144, 9, 'I wish I had used less salt in this recipe.', 'Lin Dougherty', 207, '2023-10-15');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (25, 145, 20, 'This dish was a hit at my dinner party.', 'Moss Coot', 861, '2024-01-18');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (26, 146, 38, 'The recipe was missing a key ingredient.', 'Charleen Orford', 215, '2023-08-09');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (27, 147, 20, 'I think this recipe would be better with more vegetables.', 'Cord Bolzmann', 72, '2022-10-26');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (28, 148, 36, 'I wish I had used less salt in this recipe.', 'Elyn Witherspoon', 133, '2022-12-06');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (29, 149, 21, 'I burned the sauce while making this recipe.', 'Jamaal Marzelo', 505, '2023-01-17');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (30, 150, 21, 'I overcooked the pasta in this recipe.', 'Demetrius Craister', 524, '2024-02-17');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (31, 151, 24, 'The presentation of this dish was beautiful.', 'Merlina Dows', 989, '2023-06-07');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (32, 152, 32, 'The cooking time was longer than expected.', 'Aron Terbruggen', 866, '2024-04-04');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (33, 153, 27, 'I recommend serving this with a side of rice.', 'Caterina Voyce', 537, '2023-07-22');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (34, 154, 23, 'I think I''ll try adding some spice next time.', 'Grace Kieran', 22, '2023-01-06');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (35, 155, 38, 'I overcooked the pasta in this recipe.', 'Lucie MacDwyer', 187, '2022-11-01');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (36, 156, 24, 'This recipe was a disaster', 'Juana Kirkbright', 94, '2023-03-06');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (37, 157, 38, 'I added extra garlic and it turned out amazing.', 'Magdalene Waterstone', 615, '2023-08-01');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (38, 158, 19, 'I think this recipe would be better with more vegetables.', 'Nicolis Dolton', 902, '2023-12-22');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (39, 159, 10, 'I think I''ll try adding some spice next time.', 'Lemmy Skewes', 622, '2022-12-01');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (40, 160, 39, 'I overcooked the pasta in this recipe.', 'Aime Antoniewicz', 821, '2023-01-17');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (1, 161, 29, 'I think I''ll try adding some spice next time.', 'Ronalda Berrane', 417, '2024-02-29');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (2, 162, 24, 'I overcooked the pasta in this recipe.', 'Durant Carmel', 670, '2023-07-04');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (3, 163, 21, 'I will be making this for my next potluck.', 'Hy Hanny', 274, '2024-04-11');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (4, 164, 35, 'My family loved this dish.', 'Stillman Takle', 198, '2023-03-19');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (5, 165, 22, 'The presentation of this dish was beautiful.', 'Fanya Huygen', 388, '2022-10-25');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (6, 166, 4, 'I think I''ll try adding some spice next time.', 'Hunfredo Stinton', 160, '2023-11-20');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (7, 167, 12, 'I burned the sauce while making this recipe.', 'Bekki Bothbie', 474, '2023-08-19');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (8, 168, 28, 'The flavors were a bit bland for my taste.', 'Colman Abrey', 931, '2024-04-10');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (9, 169, 25, 'I added extra garlic and it turned out amazing.', 'Melissa Bumfrey', 682, '2023-04-10');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (10, 170, 7, 'I think this recipe would be better with more vegetables.', 'Walton Luetchford', 43, '2023-09-02');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (11, 171, 30, 'I burned the sauce while making this recipe.', 'Merralee McDool', 579, '2023-05-02');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (12, 172, 23, 'This recipe was a disaster', 'Lisha Haggish', 556, '2022-10-22');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (13, 173, 4, 'The presentation of this dish was beautiful.', 'Eduardo Cowper', 105, '2022-11-03');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (14, 174, 39, 'I substituted the chicken for tofu and it worked well.', 'Werner Waind', 395, '2024-02-01');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (15, 175, 17, 'I burned the sauce while making this recipe.', 'Rorie Gaitskill', 188, '2023-05-09');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (16, 176, 21, 'The flavors were a bit bland for my taste.', 'Willi Llywarch', 273, '2023-05-29');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (17, 177, 36, 'The cooking time was longer than expected.', 'Sayre Upward', 326, '2023-11-10');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (18, 178, 17, 'I wish I had used less salt in this recipe.', 'Allyn Scimonelli', 282, '2023-12-05');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (19, 179, 1, 'I burned the sauce while making this recipe.', 'Ole Drakes', 319, '2024-01-31');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (20, 180, 22, 'I think this recipe would be better with more vegetables.', 'Andie Treneer', 368, '2023-04-02');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (21, 181, 11, 'This dish was a hit at my dinner party.', 'Umeko Hanhardt', 420, '2023-08-16');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (22, 182, 22, 'This dish was a hit at my dinner party.', 'Isacco Cooke', 844, '2023-05-15');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (23, 183, 25, 'I will definitely make this again.', 'Vaughan Olford', 408, '2024-03-14');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (24, 184, 39, 'I will definitely make this again.', 'Lin Dougherty', 250, '2023-04-07');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (25, 185, 21, 'I''m not a fan of this recipe.', 'Moss Coot', 726, '2023-07-02');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (26, 186, 23, 'I think I''ll try adding some spice next time.', 'Charleen Orford', 628, '2023-10-09');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (27, 187, 4, 'I substituted the chicken for tofu and it worked well.', 'Cord Bolzmann', 122, '2023-01-11');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (28, 188, 24, 'I substituted the chicken for tofu and it worked well.', 'Elyn Witherspoon', 593, '2023-11-26');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (29, 189, 32, 'I substituted the chicken for tofu and it worked well.', 'Jamaal Marzelo', 387, '2024-03-25');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (30, 190, 26, 'I wish I had used less salt in this recipe.', 'Demetrius Craister', 452, '2023-08-13');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (31, 191, 40, 'The presentation of this dish was beautiful.', 'Merlina Dows', 34, '2023-05-30');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (32, 192, 15, 'This recipe was a disaster', 'Aron Terbruggen', 141, '2023-05-18');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (33, 193, 27, 'The recipe was missing a key ingredient.', 'Caterina Voyce', 642, '2024-01-26');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (34, 194, 35, 'I substituted the chicken for tofu and it worked well.', 'Grace Kieran', 535, '2023-05-06');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (35, 195, 13, 'I substituted the chicken for tofu and it worked well.', 'Lucie MacDwyer', 675, '2022-10-27');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (36, 196, 8, 'The flavors were a bit bland for my taste.', 'Juana Kirkbright', 717, '2023-12-08');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (37, 197, 9, 'I substituted the chicken for tofu and it worked well.', 'Magdalene Waterstone', 178, '2023-01-14');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (38, 198, 6, 'I added extra garlic and it turned out amazing.', 'Nicolis Dolton', 290, '2023-02-26');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (39, 199, 23, 'I recommend serving this with a side of rice.', 'Lemmy Skewes', 991, '2023-11-25');
insert into Comment (UserID, CommentID, RecipeID, Text, Commenter, Likes, Date) values (40, 200, 32, 'The cooking time was longer than expected.', 'Aime Antoniewicz', 740, '2023-09-18');

# Nutrition
DELETE FROM CookerDatabase.Nutrition;
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (1, 55, 32, 5, 75, 72);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (2, 57, 57, 74, 30, 5);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (3, 72, 52, 95, 24, 93);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (4, 62, 20, 46, 10, 4);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (5, 63, 8, 99, 5, 50);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (6, 97, 36, 85, 24, 48);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (7, 67, 57, 70, 29, 49);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (8, 48, 59, 77, 12, 35);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (9, 74, 35, 48, 36, 82);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (10, 64, 33, 7, 19, 100);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (11, 92, 85, 94, 45, 49);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (12, 20, 65, 73, 91, 74);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (13, 76, 60, 36, 83, 78);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (14, 67, 47, 93, 78, 95);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (15, 82, 74, 8, 66, 19);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (16, 61, 49, 48, 36, 83);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (17, 13, 66, 16, 71, 97);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (18, 29, 18, 29, 48, 74);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (19, 68, 31, 29, 41, 91);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (20, 2, 25, 71, 56, 19);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (21, 25, 35, 12, 17, 89);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (22, 43, 19, 65, 79, 1);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (23, 82, 8, 57, 68, 12);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (24, 87, 86, 30, 13, 88);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (25, 49, 38, 81, 53, 93);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (26, 51, 40, 53, 14, 22);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (27, 27, 82, 79, 72, 16);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (28, 73, 79, 56, 32, 77);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (29, 91, 40, 31, 68, 71);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (30, 74, 20, 90, 29, 66);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (31, 57, 22, 42, 73, 70);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (32, 18, 71, 39, 14, 68);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (33, 14, 41, 75, 65, 89);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (34, 51, 47, 47, 44, 17);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (35, 84, 72, 57, 76, 53);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (36, 8, 5, 62, 9, 8);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (37, 27, 68, 10, 76, 26);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (38, 7, 14, 38, 33, 29);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (39, 37, 26, 61, 12, 47);
insert into Nutrition (RecipeID, Calories, TotalCarbohydrate, Sodium, Protein, Cholestrol) values (40, 90, 79, 24, 14, 54);

# UserMade
DELETE FROM CookerDatabase.UserMade;
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (1, 29, 8, '2004-04-02');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (2, 31, 10, '2010-11-04');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (3, 26, 10, '2010-02-17');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (4, 10, 7, '2003-04-26');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (5, 11, 4, '2005-01-17');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (6, 22, 10, '2020-05-05');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (7, 29, 8, '2005-04-12');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (8, 17, 3, '2006-07-01');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (9, 22, 9, '2000-08-16');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (10, 22, 8, '2000-11-15');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (11, 37, 5, '2000-02-23');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (12, 11, 6, '2015-09-16');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (13, 1, 10, '2002-10-19');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (14, 22, 9, '2002-05-24');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (15, 33, 8, '2020-09-05');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (16, 9, 7, '2014-09-26');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (17, 6, 1, '2004-10-31');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (18, 36, 10, '2006-04-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (19, 15, 8, '2000-08-11');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (20, 8, 7, '2015-11-09');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (21, 14, 7, '2000-10-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (22, 33, 2, '2019-04-24');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (23, 31, 3, '2000-12-24');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (24, 31, 6, '2008-06-05');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (25, 13, 2, '2023-12-12');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (26, 38, 4, '2009-09-18');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (27, 35, 9, '2003-02-16');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (28, 26, 1, '2019-11-06');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (29, 16, 7, '2015-12-08');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (30, 7, 2, '2004-12-10');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (31, 31, 7, '2005-02-25');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (32, 16, 5, '2016-09-06');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (33, 8, 6, '2005-03-18');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (34, 40, 10, '2017-10-25');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (35, 14, 7, '2007-07-13');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (36, 27, 4, '2015-10-01');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (37, 23, 5, '2004-09-21');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (38, 18, 6, '1999-12-02');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (39, 33, 1, '2023-12-04');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (40, 7, 2, '2022-08-08');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (1, 31, 10, '2009-03-19');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (2, 33, 8, '2017-10-28');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (3, 40, 10, '2008-04-29');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (4, 33, 8, '2016-10-04');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (5, 5, 6, '2004-05-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (6, 10, 2, '2011-12-01');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (7, 20, 2, '2000-07-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (8, 38, 2, '2001-09-10');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (9, 34, 7, '2003-04-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (10, 16, 3, '2021-10-30');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (11, 4, 8, '2009-11-05');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (12, 21, 6, '2023-11-01');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (13, 19, 8, '2000-10-25');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (14, 23, 5, '2003-01-03');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (15, 39, 3, '2013-05-09');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (16, 38, 9, '2013-02-17');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (17, 21, 7, '2019-12-10');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (18, 28, 6, '2012-09-17');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (19, 17, 2, '2005-11-08');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (20, 6, 8, '2014-03-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (21, 35, 8, '2004-11-25');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (22, 40, 7, '2012-08-10');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (23, 3, 6, '2016-05-05');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (24, 37, 2, '2009-01-12');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (25, 1, 8, '2012-10-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (26, 11, 6, '2011-03-13');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (27, 26, 10, '2023-02-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (28, 28, 2, '2017-04-04');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (29, 34, 2, '2001-11-18');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (30, 26, 4, '2007-03-20');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (31, 35, 8, '2023-01-28');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (32, 29, 9, '2016-07-03');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (33, 36, 5, '2014-07-01');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (34, 35, 4, '2005-04-20');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (35, 25, 4, '2019-11-16');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (36, 7, 4, '2009-08-05');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (37, 19, 5, '2005-07-15');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (38, 4, 2, '2015-08-20');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (39, 1, 1, '2021-02-03');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (40, 3, 2, '2011-04-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (1, 12, 10, '2006-11-12');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (2, 9, 4, '2000-08-02');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (3, 15, 2, '2007-06-25');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (4, 9, 3, '2018-09-07');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (5, 30, 10, '2016-10-20');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (6, 29, 7, '2024-04-08');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (7, 5, 5, '2006-05-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (8, 13, 3, '2023-12-12');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (9, 8, 2, '2019-07-16');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (10, 13, 10, '2004-07-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (11, 9, 8, '2011-01-30');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (12, 2, 5, '2023-11-01');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (13, 3, 4, '2019-09-21');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (14, 8, 5, '2014-11-29');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (15, 9, 1, '2016-08-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (16, 9, 6, '2002-02-09');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (17, 5, 8, '2011-08-04');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (18, 4, 10, '2023-01-31');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (19, 6, 7, '2020-07-02');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (20, 35, 3, '2015-07-13');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (21, 4, 3, '2015-05-07');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (22, 30, 5, '2000-08-11');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (23, 27, 9, '2008-05-12');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (24, 25, 4, '2022-03-15');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (25, 33, 10, '2003-08-30');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (26, 24, 9, '2002-07-16');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (27, 14, 3, '2020-01-28');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (28, 15, 7, '2018-03-29');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (29, 14, 5, '2009-07-19');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (30, 37, 1, '2010-07-24');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (31, 34, 10, '2001-08-09');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (32, 22, 5, '2016-03-04');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (33, 3, 8, '2018-07-01');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (34, 29, 3, '2017-03-03');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (35, 10, 10, '2008-06-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (36, 38, 1, '2007-06-04');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (37, 2, 7, '2022-10-08');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (38, 34, 10, '2006-06-14');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (39, 18, 1, '2007-10-02');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (40, 3, 3, '2007-04-06');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (1, 6, 1, '1999-10-20');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (2, 11, 7, '2003-12-15');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (3, 17, 7, '2003-06-17');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (4, 40, 8, '2009-02-11');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (5, 34, 6, '2010-07-04');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (6, 21, 2, '2015-04-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (7, 36, 7, '2014-11-24');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (8, 5, 8, '2023-02-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (9, 10, 9, '2012-12-14');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (10, 25, 9, '2003-11-07');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (11, 36, 2, '2007-10-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (12, 20, 1, '2010-08-18');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (13, 13, 1, '1999-05-16');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (14, 19, 3, '2016-11-30');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (15, 17, 9, '2002-01-08');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (16, 24, 3, '2007-01-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (17, 21, 6, '2007-02-15');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (18, 23, 8, '2001-10-24');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (19, 10, 3, '2021-06-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (20, 31, 10, '1999-11-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (21, 15, 2, '2022-08-09');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (22, 8, 10, '2014-09-17');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (23, 35, 4, '2016-12-14');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (24, 32, 3, '2020-04-25');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (25, 4, 6, '2011-10-24');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (26, 19, 3, '2023-12-23');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (27, 18, 6, '1999-05-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (28, 35, 9, '2008-06-01');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (29, 28, 5, '2004-10-31');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (30, 26, 1, '2011-06-12');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (31, 24, 2, '2017-08-16');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (32, 24, 7, '2019-07-31');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (33, 40, 1, '2000-09-23');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (34, 2, 2, '2007-06-15');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (35, 19, 8, '2022-03-25');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (36, 38, 4, '2022-03-29');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (37, 19, 10, '2003-02-11');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (38, 21, 2, '2011-11-12');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (39, 19, 10, '2013-07-24');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (40, 34, 8, '2010-07-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (1, 10, 7, '2020-07-30');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (2, 17, 4, '2023-05-10');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (3, 39, 2, '2024-02-28');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (4, 22, 7, '2000-08-25');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (5, 9, 1, '2014-09-21');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (6, 30, 6, '2006-10-09');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (7, 19, 7, '2019-07-31');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (8, 2, 1, '2019-03-30');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (9, 33, 7, '2005-07-28');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (10, 36, 3, '2018-07-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (11, 40, 7, '2023-03-10');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (12, 38, 3, '2013-10-14');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (13, 27, 7, '2011-05-24');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (14, 4, 5, '2002-04-30');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (15, 20, 6, '2002-08-15');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (16, 10, 5, '2014-02-23');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (17, 27, 10, '2005-05-29');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (18, 13, 3, '1999-06-17');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (19, 10, 2, '2008-04-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (20, 6, 7, '2001-04-28');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (21, 19, 4, '2001-06-10');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (22, 24, 4, '2010-09-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (23, 18, 7, '2009-12-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (24, 20, 9, '2016-10-25');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (25, 7, 1, '2005-10-05');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (26, 16, 7, '2001-01-12');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (27, 38, 4, '2005-03-02');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (28, 31, 7, '2022-04-11');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (29, 11, 6, '2023-07-30');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (30, 21, 6, '2019-01-07');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (31, 18, 1, '2009-07-16');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (32, 30, 4, '2020-09-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (33, 10, 9, '2005-02-04');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (34, 5, 8, '2009-09-29');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (35, 12, 4, '2015-08-28');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (36, 15, 6, '2009-08-22');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (37, 34, 5, '2013-02-04');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (38, 8, 2, '2020-11-15');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (39, 21, 8, '2023-06-27');
insert into UserMade (UserID, RecipeID, Rating, Datemade) values (40, 22, 10, '2007-09-09');

# Recommendation List
DELETE FROM CookerDatabase.RecommendationList;
insert into RecommendationList (UserID, ListID, DateCreated) values (1, 1, '2023-04-13');
insert into RecommendationList (UserID, ListID, DateCreated) values (2, 2, '2021-03-27');
insert into RecommendationList (UserID, ListID, DateCreated) values (3, 3, '2016-04-15');
insert into RecommendationList (UserID, ListID, DateCreated) values (4, 4, '2010-06-15');
insert into RecommendationList (UserID, ListID, DateCreated) values (5, 5, '2013-09-27');
insert into RecommendationList (UserID, ListID, DateCreated) values (6, 6, '1999-06-30');
insert into RecommendationList (UserID, ListID, DateCreated) values (7, 7, '2010-08-24');
insert into RecommendationList (UserID, ListID, DateCreated) values (8, 8, '2021-10-26');
insert into RecommendationList (UserID, ListID, DateCreated) values (9, 9, '2007-12-10');
insert into RecommendationList (UserID, ListID, DateCreated) values (10, 10, '2007-11-21');
insert into RecommendationList (UserID, ListID, DateCreated) values (11, 11, '2009-08-10');
insert into RecommendationList (UserID, ListID, DateCreated) values (12, 12, '2023-06-21');
insert into RecommendationList (UserID, ListID, DateCreated) values (13, 13, '2014-12-17');
insert into RecommendationList (UserID, ListID, DateCreated) values (14, 14, '2016-09-10');
insert into RecommendationList (UserID, ListID, DateCreated) values (15, 15, '2002-07-03');
insert into RecommendationList (UserID, ListID, DateCreated) values (16, 16, '2014-12-24');
insert into RecommendationList (UserID, ListID, DateCreated) values (17, 17, '2016-02-19');
insert into RecommendationList (UserID, ListID, DateCreated) values (18, 18, '2017-09-20');
insert into RecommendationList (UserID, ListID, DateCreated) values (19, 19, '2008-11-16');
insert into RecommendationList (UserID, ListID, DateCreated) values (20, 20, '2023-10-07');
insert into RecommendationList (UserID, ListID, DateCreated) values (21, 21, '2002-10-13');
insert into RecommendationList (UserID, ListID, DateCreated) values (22, 22, '2005-07-14');
insert into RecommendationList (UserID, ListID, DateCreated) values (23, 23, '2002-05-12');
insert into RecommendationList (UserID, ListID, DateCreated) values (24, 24, '2006-02-20');
insert into RecommendationList (UserID, ListID, DateCreated) values (25, 25, '2020-12-10');
insert into RecommendationList (UserID, ListID, DateCreated) values (26, 26, '2017-11-12');
insert into RecommendationList (UserID, ListID, DateCreated) values (27, 27, '2023-12-26');
insert into RecommendationList (UserID, ListID, DateCreated) values (28, 28, '2007-05-08');
insert into RecommendationList (UserID, ListID, DateCreated) values (29, 29, '2000-04-21');
insert into RecommendationList (UserID, ListID, DateCreated) values (30, 30, '2017-01-18');
insert into RecommendationList (UserID, ListID, DateCreated) values (31, 31, '2016-02-02');
insert into RecommendationList (UserID, ListID, DateCreated) values (32, 32, '2002-02-25');
insert into RecommendationList (UserID, ListID, DateCreated) values (33, 33, '2013-09-14');
insert into RecommendationList (UserID, ListID, DateCreated) values (34, 34, '2019-07-17');
insert into RecommendationList (UserID, ListID, DateCreated) values (35, 35, '2007-06-14');
insert into RecommendationList (UserID, ListID, DateCreated) values (36, 36, '2002-11-07');
insert into RecommendationList (UserID, ListID, DateCreated) values (37, 37, '2019-09-06');
insert into RecommendationList (UserID, ListID, DateCreated) values (38, 38, '2005-02-28');
insert into RecommendationList (UserID, ListID, DateCreated) values (39, 39, '2012-01-13');
insert into RecommendationList (UserID, ListID, DateCreated) values (40, 40, '2015-06-02');

# Recipe Recommendation
DELETE FROM CookerDatabase.RecommendationRecipe;
insert into RecommendationRecipe (UserID, ListID, Recipe) values (1, 1, 1);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (2, 2, 29);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (3, 3, 40);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (4, 4, 4);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (5, 5, 36);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (6, 6, 34);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (7, 7, 8);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (8, 8, 24);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (9, 9, 4);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (10, 10, 4);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (11, 11, 17);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (12, 12, 6);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (13, 13, 31);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (14, 14, 13);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (15, 15, 25);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (16, 16, 23);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (17, 17, 10);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (18, 18, 33);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (19, 19, 5);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (20, 20, 7);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (21, 21, 10);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (22, 22, 10);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (23, 23, 27);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (24, 24, 12);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (25, 25, 20);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (26, 26, 33);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (27, 27, 37);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (28, 28, 21);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (29, 29, 19);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (30, 30, 16);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (31, 31, 5);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (32, 32, 7);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (33, 33, 30);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (34, 34, 31);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (35, 35, 39);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (36, 36, 23);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (37, 37, 5);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (38, 38, 8);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (39, 39, 26);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (40, 40, 34);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (3, 3, 11);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (4, 4, 5);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (5, 5, 33);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (6, 6, 22);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (7, 7, 2);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (8, 8, 15);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (9, 9, 12);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (10, 10, 27);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (11, 11, 31);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (12, 12, 2);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (13, 13, 22);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (14, 14, 17);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (15, 15, 9);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (16, 16, 30);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (17, 17, 40);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (18, 18, 32);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (19, 19, 4);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (20, 20, 24);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (21, 21, 14);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (22, 22, 11);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (23, 23, 4);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (24, 24, 36);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (25, 25, 15);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (26, 26, 16);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (27, 27, 25);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (28, 28, 13);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (29, 29, 37);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (30, 30, 28);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (31, 31, 24);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (32, 32, 8);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (33, 33, 32);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (34, 34, 15);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (35, 35, 37);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (36, 36, 21);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (37, 37, 13);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (38, 38, 23);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (39, 39, 4);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (40, 40, 7);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (1, 1, 31);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (2, 2, 25);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (3, 3, 30);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (4, 4, 29);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (5, 5, 2);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (6, 6, 28);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (7, 7, 33);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (8, 8, 17);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (9, 9, 35);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (10, 10, 3);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (11, 11, 7);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (12, 12, 24);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (13, 13, 29);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (14, 14, 30);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (15, 15, 8);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (16, 16, 10);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (17, 17, 16);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (18, 18, 30);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (19, 19, 8);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (20, 20, 28);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (21, 21, 37);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (22, 22, 20);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (23, 23, 40);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (24, 24, 39);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (25, 25, 38);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (27, 27, 8);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (28, 28, 15);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (29, 29, 28);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (30, 30, 2);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (31, 31, 39);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (32, 32, 36);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (33, 33, 40);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (34, 34, 29);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (35, 35, 38);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (36, 36, 26);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (37, 37, 23);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (40, 40, 9);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (1, 1, 24);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (2, 2, 26);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (3, 3, 29);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (4, 4, 11);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (5, 5, 35);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (6, 6, 27);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (7, 7, 9);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (8, 8, 40);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (9, 9, 21);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (10, 10, 33);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (11, 11, 21);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (12, 12, 21);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (13, 13, 11);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (15, 15, 32);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (16, 16, 14);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (17, 17, 25);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (18, 18, 35);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (19, 19, 28);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (20, 20, 2);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (21, 21, 27);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (22, 22, 25);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (23, 23, 10);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (24, 24, 26);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (25, 25, 14);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (26, 26, 14);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (28, 28, 25);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (29, 29, 15);
insert into RecommendationRecipe (UserID, ListID, Recipe) values (30, 30, 38);
