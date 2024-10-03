import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/app_bar.dart';
import 'package:recipe_app/commons/bottom_navigation_bar.dart';
import 'package:recipe_app/commons/text_field.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/utilities/constants/image_constants.dart';


class MyProfileScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'My Profile',
        appBar: AppBar(),
      ),
      body: Form(
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
                        hintText: 'Full Name',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 16),
                      UserInputTextField(
                        hintText: 'Email Id',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),
                      UserInputTextField(
                        hintText: 'Phone Number',
                        keyboardType: TextInputType.number,
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
                            child: Label( label:
                            'Update Password',
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
                          minimumSize: WidgetStateProperty.all<Size>(
                            Size(Get.width, 50),
                          ),
                          backgroundColor:
                          WidgetStateProperty.all<Color>(Color(0xFFFF6600)),
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
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
