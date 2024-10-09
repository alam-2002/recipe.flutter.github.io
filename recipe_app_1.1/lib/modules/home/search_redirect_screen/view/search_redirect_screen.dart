import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/rectangular_botton.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/home/bookmark_screen/controller/bookmark_controller.dart';
import 'package:recipe_app/modules/home/latest_recipes_screen/model/recipe_api_model.dart';
import 'package:recipe_app/navigation/routes.dart';
import 'package:recipe_app/theme/colors_class.dart';
import 'package:recipe_app/utilities/constants/image_constants.dart';

class SearchRedirectScreen extends StatelessWidget {
  final RecipeApiModel? recipes;
  SearchRedirectScreen({super.key, this.recipes});

  final BookmarkController bookmarkController = Get.put(BookmarkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FirebaseAuth.instance.currentUser != null
      ? AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Label(
          label: recipes!.label.toString().trim(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          Obx(() => IconButton(
                onPressed: () {
                  bookmarkController.toggleBookmark(recipes!);
                  bookmarkController.isBookmarked(recipes!)
                      ? showCenteredToast(
                          context, "Recipe added to your bookmarks")
                      : showCenteredToast(
                          context, "Recipe Removed from your bookmarks");
                },
                icon: Icon(
                  bookmarkController.isBookmarked(recipes!)
                      ? Icons.bookmark_added
                      : Icons.bookmark_border,
                ),
              )),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp)),
        ],
      )
      : AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
      body: FirebaseAuth.instance.currentUser != null
          ? SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(recipes!.image.toString()),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(1.5, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              width: 200,
                              decoration: BoxDecoration(
                                color: ColorsClass.primaryOrange,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_circle,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  Label(
                                    label: 'Watch Video',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Label(
                            label: 'Ingredients',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          SizedBox(height: 10),
                          Label(
                            label: recipes!.ingredients.toString(),
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Label(
                            label: 'Method',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          SizedBox(height: 10),
                          Label(
                            label:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                            maxLines: 3,
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 15),
                          Label(
                            label:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                            maxLines: 3,
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 15),
                          Label(
                            label:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                            maxLines: 3,
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
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
      bottomNavigationBar: FirebaseAuth.instance.currentUser != null
       ? Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RectangularButton(
            onPressed: () {
              bookmarkController.toggleBookmark(recipes!);
              bookmarkController.isBookmarked(recipes!)
                  ? showCenteredToast(context, "Recipe added to your bookmarks")
                  : showCenteredToast(
                      context, "Recipe Removed from your bookmarks");
              // Get.toNamed(Routes.bookmarkScreen);
            },
            title: 'Select for Favorite',
          ),
          SizedBox(height: 10),
        ],
      )
          : null
    );
  }

  void showCenteredToast(BuildContext context, String message) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2))
        .then((_) => overlayEntry.remove());
  }
}
