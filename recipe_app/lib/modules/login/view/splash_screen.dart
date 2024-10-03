import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/login/view/enter_name_screen.dart';
import 'package:recipe_app/utilities/constants/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = 'Login';

  @override
  void initState() {
    super.initState();
    _navigateToHome();
    // whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(splashImg), fit: BoxFit.cover),
        ),
        child: Center(
          child: Label(
            label: 'Logo',
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    // Get.offNamed(Routes.emailLoginScreen);
    Get.to(() => EnterNameScreen());
  }

  // void whereToGo() async {
  //   var sharedPref = await SharedPreferences.getInstance();
  //
  //   var isLoggedIn = sharedPref.getBool(KEYLOGIN);
  //
  //   Timer(
  //     const Duration(seconds: 3),
  //         () {
  //       if (isLoggedIn != null) {
  //         if (isLoggedIn) {
  //           // Get.offAll(HomeScreen());
  //           Get.offAllNamed(Routes.homeScreen);
  //         } else {
  //           // Get.offAll(EmailLogin());
  //           Get.offAllNamed(Routes.emailLoginScreen);
  //         }
  //       } else {
  //         // Get.offAll(EmailLogin());
  //         Get.offAllNamed(Routes.emailLoginScreen);
  //       }
  //     },
  //   );
  // }
}
