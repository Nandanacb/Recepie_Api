import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipee_app_api/datamodel.dart';
import 'package:recipee_app_api/secondpage.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});
  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  bool _isloading = true;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  RecipeemodelApi? dataFromAPI;
  _getData() async {
    try {
      String url = "https://dummyjson.com/recipes";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = RecipeemodelApi.fromJson(json.decode(res.body));
        _isloading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 212, 156),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 212, 156),
        title: Text("Recipe API"),
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : dataFromAPI == null
              ? const Center(
                  child: Text('Failed to load data'),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: dataFromAPI?.recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = dataFromAPI!.recipes[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Secondpage(
                                          recipe: recipe,
                                        )));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              children: [
                                Image.network(
                                  recipe.image,
                                  width: 100,
                                  height: 80,
                                ),
                                Text(recipe.name),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(recipe.cuisine),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
    );
  }
}
