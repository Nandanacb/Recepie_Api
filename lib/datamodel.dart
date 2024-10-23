// To parse this JSON data, do
//
//     final recipeemodel = recipeemodelFromJson(jsonString);

import 'dart:convert';

RecipeemodelApi recipeemodelFromJson(String str) =>
    RecipeemodelApi.fromJson(json.decode(str));

String recipeemodelToJson(RecipeemodelApi data) => json.encode(data.toJson());

class RecipeemodelApi {
  List<Recipe> recipes;

  RecipeemodelApi({
    required this.recipes,
  });

  factory RecipeemodelApi.fromJson(Map<String, dynamic> json) =>
      RecipeemodelApi(
        recipes:
            List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
      };
}

class Recipe {
  String name;
  List<String> ingredients;
  List<String> instructions;
  int prepTimeMinutes;
  int servings;
  String cuisine;

  String image;

  List<String> mealType;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.servings,
    required this.cuisine,
    required this.image,
    required this.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        name: json["name"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        instructions: List<String>.from(json["instructions"].map((x) => x)),
        prepTimeMinutes: json["prepTimeMinutes"],
        servings: json["servings"],
        cuisine: json["cuisine"],
        image: json["image"],
        mealType: List<String>.from(json["mealType"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
        "prepTimeMinutes": prepTimeMinutes,
        "servings": servings,
        "cuisine": cuisine,
        "image": image,
        "mealType": List<dynamic>.from(mealType.map((x) => x)),
      };
}
