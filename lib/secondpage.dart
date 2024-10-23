import 'package:flutter/material.dart';
import 'package:recipee_app_api/datamodel.dart';

class Secondpage extends StatelessWidget {
  final Recipe recipe;
  const Secondpage({required this.recipe});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 212, 156),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 212, 156),
        title: Text("RECIPEE"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  recipe.image,
                  height: 300,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Name:${recipe.name})",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "cuisine:${recipe.cuisine}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "mealType:${recipe.mealType}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "servings:${recipe.servings}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "prepTimeMinutes:${recipe.prepTimeMinutes}",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Ingredients:${recipe.ingredients}",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "instructions:${recipe.instructions}",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
