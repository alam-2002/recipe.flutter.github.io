import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/modules/home/latest_recipes_screen/model/recipe_api_model.dart';
import 'package:recipe_app/modules/home/search_redirect_screen/view/search_redirect_screen.dart';

class LatestRecipeScreen extends StatefulWidget {
  LatestRecipeScreen({super.key, this.searchText});
  String? searchText;

  @override
  State<LatestRecipeScreen> createState() => _LatestRecipeScreenState();
}

class _LatestRecipeScreenState extends State<LatestRecipeScreen> {
  List<RecipeApiModel> list = <RecipeApiModel>[];
  final TextEditingController searchController = TextEditingController();
  // List<RecipeApiModel> recipes = [];

  @override
  void initState() {
    getApiData(searchText: widget.searchText!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: TextField(
          controller: searchController,
          onChanged: (value) {
            widget.searchText = searchController.text.toString();
            setState(() {
              // getApiDta(searchText: searchController.text.toString());
            });
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            hintText: 'Search Recipe',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(30),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Label(
                label: 'Search Recipes for “${widget.searchText}”',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: Get.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final x = list[index];
                    final recipes = list[index];
                    return InkWell(
                      onTap: (){
                        Get.to(() => SearchRedirectScreen(recipes: recipes));
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 180,
                                    child: Label(
                                      label: x.label.toString(),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    width: 170,
                                    child: Label(
                                      label: x.ingredients.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Label(
                                    label: 'by - ${x.source.toString()}',
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                              child: Image.network(
                                  x.image.toString(),
                                  height: 110,
                                ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  getApiData({required String searchText}) async {
    final url =
        'https://api.edamam.com/api/recipes/v2?type=public&q=$searchText&app_id=81c6985d&app_key=fd0c17158016d4f5956060f03383cc43%09&imageSize=REGULAR&random=true';
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    json['hits'].forEach((e) {
      RecipeApiModel model = RecipeApiModel(
        url: e['recipe']['url'],
        image: e['recipe']['image'],
        source: e['recipe']['source'],
        label: e['recipe']['label'],
        ingredients: List<String>.from(e['recipe']['ingredientLines']),
      );
      setState(() {
        list.add(model);
      });
    });
  }
}
