import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/app_bar.dart';
import 'package:recipe_app/commons/bottom_navigation_bar.dart';
import 'package:recipe_app/commons/text_field.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/login/controller/authentication_controller.dart';
import 'package:recipe_app/modules/home/profile_screen/controller/profile_controller.dart';
import 'package:recipe_app/modules/login/model/user_model.dart';
import 'package:recipe_app/navigation/routes.dart';
import 'package:recipe_app/theme/colors_class.dart';
import 'package:recipe_app/utilities/constants/image_constants.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final profileController = Get.put(ProfileController());
  final authenticationController = Get.put(AuthenticationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'My Profile',
        appBar: AppBar(),
      ),
      body: FirebaseAuth.instance.currentUser != null
          ? SingleChildScrollView(
            child: FutureBuilder(
                future: profileController.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && snapshot.data != null) {
                      UserModel userData = snapshot.data!;
                      return Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 30),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 105,
                                        width: 110,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              profilePicture,
                                              height: 105,
                                              width: double.maxFinite,
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Image.asset(
                                                cameraIcon,
                                                height: 36,
                                                width: 36,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 62),
                                      UserInputTextField(
                                        readOnly: true,
                                        initialValue:
                                            '${userData.firstName} ${userData.lastName}',
                                        // hintText: 'Full Name',
                                        // keyboardType: TextInputType.text,
                                      ),
                                      SizedBox(height: 16),
                                      UserInputTextField(
                                        readOnly: true,
                                        initialValue: userData.email,
                                        // hintText: 'Email Id',
                                        // keyboardType: TextInputType.emailAddress,
                                      ),
                                      SizedBox(height: 16),
                                      UserInputTextField(
                                        readOnly: true,
                                        // initialValue: userData.fullName,
                                        hintText: 'Phone Number',
                                        // keyboardType: TextInputType.number,
                                      ),
                                      SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 20),
                                          child: TextButton(
                                            onPressed: () {
                                              // Get.toNamed(Routes.updatePasswordScreen);
                                            },
                                            child: Label(
                                              label: 'Update Password',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color: Color(0xFFFF6600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          minimumSize:
                                              WidgetStateProperty.all<Size>(
                                            Size(Get.width, 50),
                                          ),
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  Color(0xFFFF6600)),
                                        ),
                                        child: Text(
                                          'Save Changes',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      //-----------------------
                                      SizedBox(height: 5),
                                      TextButton(
                                        onPressed: () {
                                          // Get.toNamed(Routes.deleteAccountScreen);
                                        },
                                        child: Label(
                                          label: 'Delete Account',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Label(label: snapshot.error.toString()));
                    } else {
                      return SizedBox(
                        height: Get.height * 0.5,
                        child: Center(
                            child: Label(label: 'No user data available')),
                      );
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
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
                        backgroundColor: WidgetStateProperty.all<Color>(ColorsClass.primaryOrange),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Rounded corners
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
