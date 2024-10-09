import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/home/1.home_screen/view/home_screen.dart';
import 'package:recipe_app/modules/login/view/email_login_screen.dart';
import 'package:recipe_app/utilities/constants/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // static const String KEYLOGIN = 'Login';

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
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(2, 5),
              ),
            ],
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
      ),
    );
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Get.to(() => HomeScreen());
    // Get.offNamed(Routes.enterNameScreen);
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
