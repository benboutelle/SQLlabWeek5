
CREATE TABLE "Users" (
	"user_id" serial PRIMARY KEY NOT NULL,
	"username" varchar(300) NOT NULL UNIQUE,
	"password" varchar(1000) NOT NULL UNIQUE,
	"email" varchar(20) NOT NULL UNIQUE,
	"Firstname" varchar(20) NOT NULL UNIQUE,
	"Lastname" varchar(20) NOT NULL UNIQUE,
	

);



CREATE TABLE "ingredients" (
	"Ingredients_id" serial PRIMARY KEY NOT NULL,
	"name" varchar(420) NOT NULL UNIQUE,
	

);



CREATE TABLE "IngredientRecipe" (
	"Recipe_Ingredient_id" serial PRIMARY KEY NOT NULL,
	"ingredient_id" integer NOT NULL,
	"Recipe_id" integer NOT NULL UNIQUE,


);



CREATE TABLE "Recipe" (
	"Recipe_id" serial PRIMARY KEY NOT NULL,
	"name" varchar(20) NOT NULL UNIQUE,
	"chef" varchar(20) NOT NULL UNIQUE,
	"privacy" BOOLEAN NOT NULL UNIQUE,
	"instructions" TEXT(20) NOT NULL UNIQUE,
	

);



CREATE TABLE "holidays" (
	"holidays_id" serial PRIMARY KEY NOT NULL,
	"name" varchar(25) NOT NULL UNIQUE,
	

);



CREATE TABLE "GroceryList" (
	"GroceryList_id" serial PRIMARY KEY NOT NULL,
	"ingredients_id" integer NOT NULL,
	"Recipe_id" integer NOT NULL,
	

);



CREATE TABLE "HolidayRecipe" (
	"HolidayRecipe_id" serial PRIMARY KEY NOT NULL,
	"holidays_id" integer NOT NULL UNIQUE,
	"recipe_id" integer NOT NULL UNIQUE,
	

);





ALTER TABLE "IngredientRecipe" ADD CONSTRAINT "IngredientRecipe_fk0" FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("Ingredients_id");
ALTER TABLE "IngredientRecipe" ADD CONSTRAINT "IngredientRecipe_fk1" FOREIGN KEY ("Recipe_id") REFERENCES "Recipe"("Recipe_id");

ALTER TABLE "Recipe" ADD CONSTRAINT "Recipe_fk0" FOREIGN KEY ("chef") REFERENCES "Users"("user_id");


ALTER TABLE "GroceryList" ADD CONSTRAINT "GroceryList_fk0" FOREIGN KEY ("ingredients_id") REFERENCES "ingredients"("Ingredients_id");
ALTER TABLE "GroceryList" ADD CONSTRAINT "GroceryList_fk1" FOREIGN KEY ("Recipe_id") REFERENCES "Recipe"("Recipe_id");

ALTER TABLE "HolidayRecipe" ADD CONSTRAINT "HolidayRecipe_fk0" FOREIGN KEY ("holidays_id") REFERENCES "holidays"("holidays_id");
ALTER TABLE "HolidayRecipe" ADD CONSTRAINT "HolidayRecipe_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipe"("Recipe_id");



