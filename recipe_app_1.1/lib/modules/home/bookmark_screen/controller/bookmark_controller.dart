import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:recipe_app/modules/home/latest_recipes_screen/model/recipe_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class BookmarkController extends GetxController {
  var bookmarkedRecipes = <RecipeApiModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  void addRecipeToBookmark(RecipeApiModel recipe) {
    bookmarkedRecipes.add(recipe);
    saveBookmarks();
  }

  void removeRecipeFromBookmark(RecipeApiModel recipe /*int index*/) {
    // bookmarkedRecipes.removeAt(index);
    // bookmarkedRecipes.clear();
    bookmarkedRecipes.remove(recipe);
    saveBookmarks();
  }

  // Save bookmarks to SharedPreferences
  void saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonBookmarks = bookmarkedRecipes.map((recipe) => jsonEncode(recipe.toJson())).toList();
    await prefs.setStringList('bookmarks', jsonBookmarks);
  }

  // Load bookmarks from SharedPreferences
  void loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonBookmarks = prefs.getStringList('bookmarks');
    if (jsonBookmarks != null) {
      bookmarkedRecipes.value = jsonBookmarks.map((bookmark) => RecipeApiModel.fromJson(jsonDecode(bookmark))).toList();
    }
  }


  // Function to add or remove a bookmark
  void toggleBookmark(RecipeApiModel recipe) {
    if (isBookmarked(recipe)) {
      bookmarkedRecipes.removeWhere((item) => item.label == recipe.label);
    } else {
      bookmarkedRecipes.add(recipe);
    }
  }

  // Check if a recipe is bookmarked
  bool isBookmarked(RecipeApiModel recipe) {
    return bookmarkedRecipes.any((item) => item.label == recipe.label);
  }

}
