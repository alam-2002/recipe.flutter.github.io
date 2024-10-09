import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/app_bar.dart';
import 'package:recipe_app/commons/bottom_navigation_bar.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/home/bookmark_screen/controller/bookmark_controller.dart';
import 'package:recipe_app/modules/home/latest_recipes_screen/model/recipe_api_model.dart';
import 'package:recipe_app/modules/home/search_redirect_screen/view/search_redirect_screen.dart';
import 'package:recipe_app/navigation/routes.dart';
import 'package:recipe_app/theme/colors_class.dart';
import 'package:recipe_app/utilities/constants/image_constants.dart';

class BookmarkScreen extends StatelessWidget {
  final BookmarkController bookmarkController = Get.find();

  BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: 'Your Bookmark Recipes',
        fontSize: 21,
      ),
      body: FirebaseAuth.instance.currentUser != null
          ? SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Obx(
                  () => bookmarkController.bookmarkedRecipes.isEmpty
                      ? SizedBox(
                          height: Get.height * 0.5,
                          child: Center(
                            child: Label(
                              label: 'No Bookmarks Yet',
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount:
                              bookmarkController.bookmarkedRecipes.length,
                          itemBuilder: (context, index) {
                            RecipeApiModel recipe =
                                bookmarkController.bookmarkedRecipes[index];
                            final recipes =
                                bookmarkController.bookmarkedRecipes[index];
                            return InkWell(
                              onTap: () {
                                Get.to(() =>
                                    SearchRedirectScreen(recipes: recipes));
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 180,
                                                child: Label(
                                                  label:
                                                      recipe.label.toString(),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              SizedBox(
                                                width: 170,
                                                child: Label(
                                                  label: recipe.ingredients
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Label(
                                                label:
                                                    'by - ${recipe.source.toString()}',
                                                fontSize: 12,
                                              ),
                                            ],
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                          child: Image.network(
                                            recipe.image.toString(),
                                            height: 110,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                                child: Image.asset(
                                                  imgNotFound,
                                                  fit: BoxFit.cover,
                                                  height: 100,
                                                  width: 100,
                                                  // width: Get.width,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      left: -15,
                                      top: -14,
                                      child: IconButton(
                                        onPressed: () {
                                          bookmarkController
                                              .toggleBookmark(recipes);
                                          bookmarkController
                                              .removeRecipeFromBookmark(
                                                  recipes);
                                        },
                                        icon: Icon(
                                          Icons.bookmark_remove_outlined,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      blankAvatar,
                      height: 200,
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.emailLoginScreen);
                      },
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all<Size>(
                          Size(80, 50),
                        ),
                        backgroundColor: WidgetStateProperty.all<Color>(
                            ColorsClass.primaryOrange),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Rounded corners
                          ),
                        ),
                      ),
                      child: Label(
                        label: 'Login',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
