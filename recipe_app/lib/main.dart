import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/modules/home/1.home_screen/view/home_screen.dart';
import 'package:recipe_app/modules/login/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: HomeScreen(),
    );
  }
}

