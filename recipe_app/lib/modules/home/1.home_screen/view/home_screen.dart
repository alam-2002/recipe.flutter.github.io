import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/bottom_navigation_bar.dart';
import 'package:recipe_app/commons/drawer_widget.dart';
import 'package:recipe_app/commons/grid_view_card_widget.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/home/latest_recipes_screen/view/latest_recipe_screen.dart';
import 'package:recipe_app/utilities/constants/image_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


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
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
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
                      return Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('All'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Favorites'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Veg'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Non-Veg'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Sweets'),
                          ),
                        ],
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
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GridViewCard(
                    onTap: () {
                      Get.to(() => LatestRecipeScreen());
                    },
                    imageUrl: margaritaPizza,
                    name: 'Margarita Pizza',
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
}

