import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/bottom_navigation_bar.dart';
import 'package:recipe_app/commons/drawer_widget.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/home/1.home_screen/controller/category_controller.dart';
import 'package:recipe_app/modules/home/latest_recipes_screen/view/latest_recipe_screen.dart';
import 'package:recipe_app/modules/home/search_redirect_screen/view/search_redirect_screen.dart';
import 'package:recipe_app/navigation/routes.dart';
import 'package:recipe_app/theme/colors_class.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/modules/home/latest_recipes_screen/model/recipe_api_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final CategorySelectionController controller =
      Get.put(CategorySelectionController());
  List<RecipeApiModel> list = <RecipeApiModel>[];
  final TextEditingController searchController = TextEditingController();
  String searchText = 'food';

  @override
  void initState() {
    constantGetApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 30,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Label(
          maxLines: 2,
          label: 'Find Best Recipe for Cooking',
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: Colors.black,
        ),
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  searchText = value;
                  setState(() {});
                },
                controller: searchController,
                // keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      Get.to(() => LatestRecipeScreen(searchText: searchText));
                    },
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
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.selectCategory(0);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  controller.selectedIndex.value == 0
                                      ? ColorsClass.primaryOrange
                                      : ColorsClass.basicWhite),
                              foregroundColor: WidgetStateProperty.all<Color>(
                                  controller.selectedIndex.value == 0
                                      ? ColorsClass.basicWhite
                                      : ColorsClass.basicBlack),
                            ),
                            child: Text('All'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              controller.selectCategory(1);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  controller.selectedIndex.value == 1
                                      ? ColorsClass.primaryOrange
                                      : ColorsClass.basicWhite),
                              foregroundColor: WidgetStateProperty.all<Color>(
                                  controller.selectedIndex.value == 1
                                      ? ColorsClass.basicWhite
                                      : ColorsClass.basicBlack),
                            ),
                            child: Text('Favorites'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              controller.selectCategory(2);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  controller.selectedIndex.value == 2
                                      ? ColorsClass.primaryOrange
                                      : ColorsClass.basicWhite),
                              foregroundColor: WidgetStateProperty.all<Color>(
                                  controller.selectedIndex.value == 2
                                      ? ColorsClass.basicWhite
                                      : ColorsClass.basicBlack),
                            ),
                            child: Text('Veg'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              controller.selectCategory(3);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  controller.selectedIndex.value == 3
                                      ? ColorsClass.primaryOrange
                                      : ColorsClass.basicWhite),
                              foregroundColor: WidgetStateProperty.all<Color>(
                                  controller.selectedIndex.value == 3
                                      ? ColorsClass.basicWhite
                                      : ColorsClass.basicBlack),
                            ),
                            child: Text('Non-Veg'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              controller.selectCategory(4);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  controller.selectedIndex.value == 4
                                      ? ColorsClass.primaryOrange
                                      : ColorsClass.basicWhite),
                              foregroundColor: WidgetStateProperty.all<Color>(
                                  controller.selectedIndex.value == 4
                                      ? ColorsClass.basicWhite
                                      : ColorsClass.basicBlack),
                            ),
                            child: Text('Sweets'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Label(
                label: 'Today’s popular searches',
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              SizedBox(height: 20),
              GridView.builder(
                physics: ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final x = list[index];
                  final recipes = list[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => SearchRedirectScreen(recipes: recipes));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(x.image.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 125),
                          Container(
                            padding: EdgeInsets.all(5),
                            height: 40,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                            ),
                            child: Label(
                              label: x.label.toString(),
                              fontSize: 12,
                              color: Colors.white,
                              // color: ColorsClass.primaryOrange,
                              fontWeight: FontWeight.bold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }

  constantGetApiData() async {
    const url =
        'https://api.edamam.com/api/recipes/v2?type=public&q=food&app_id=81c6985d&app_key=fd0c17158016d4f5956060f03383cc43%09&imageSize=REGULAR&random=true';
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
      if (mounted) {
        setState(() {
          list.add(model);
        });
      }
    });
  }
}
