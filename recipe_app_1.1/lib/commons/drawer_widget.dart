import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/modules/login/controller/authentication_controller.dart';
import 'package:recipe_app/navigation/routes.dart';
import 'package:recipe_app/theme/colors_class.dart';
import 'package:recipe_app/utilities/constants/image_constants.dart';
import 'text_widget.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final authenticationController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? Drawer(
            child: Container(
              width: 326,
              decoration: BoxDecoration(
                color: ColorsClass.basicWhite,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.profileScreen);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 28, vertical: 38),
                      decoration: BoxDecoration(
                        color: ColorsClass.concreteColor,
                      ),
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Image.asset(
                            profilePicture,
                            height: 64,
                            width: 64,
                            alignment: Alignment.bottomCenter,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Label(
                                  label: 'Maltida Brown',
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 21,
                                ),
                                Label(
                                  label: 'matildabrown@gmail.com',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: ColorsClass.basicGrey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.profileScreen);
                    },
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 14, right: 24),
                      child: _drawerSection(
                        boldText: 'Personal Details',
                        greyText: 'Already have 12 orders',
                        onTap: () {
                          Get.toNamed(Routes.profileScreen);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      print('About Us');
                    },
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 14, right: 24),
                      child: _drawerSection(
                        boldText: 'About Us',
                        greyText: 'Lorem Ipsum is simply dummy text',
                        onTap: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      // Get.toNamed(Routes.raiseIssueScreen);
                      print('Support');
                    },
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 16, right: 22),
                      child: _drawerSection(
                        boldText: 'Support',
                        greyText: 'Lorem Ipsum is simply dummy text',
                        onTap: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.notificationScreen);
                    },
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 16, right: 22),
                      child: _drawerSection(
                        boldText: 'Notification',
                        greyText: 'Lorem Ipsum is simply dummy text',
                        onTap: () {
                          Get.toNamed(Routes.notificationScreen);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      authenticationController.logout();
                      print('Logout');
                    },
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 16, right: 22),
                      child: _drawerSection(
                        boldText: 'Logout',
                        greyText: 'Lorem Ipsum is simply dummy text',
                        onTap: () {
                          authenticationController.logout();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Drawer(
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset(
                  blankAvatar,
                  height: 150,
                ),
                ElevatedButton(
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
              ],
            ),
          );
  }

  Widget _drawerSection(
      {required String boldText,
      required String greyText,
      required VoidCallback onTap}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(
                  label: boldText,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
                SizedBox(height: 1),
                Label(
                  label: greyText,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: onTap,
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 24,
          ),
        ),
      ],
    );
  }

}

/*Drawer(
      child: Container(
        width: 326,
        decoration: BoxDecoration(
          color: ColorsClass.basicWhite,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.profileScreen);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 38),
                decoration: BoxDecoration(
                  color: ColorsClass.concreteColor,
                ),
                width: double.maxFinite,
                child: Row(
                  children: [
                    Image.asset(
                      profilePicture,
                      height: 64,
                      width: 64,
                      alignment: Alignment.bottomCenter,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Label(
                            label: 'Maltida Brown',
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w700,
                            fontSize: 21,
                          ),
                          Label(
                            label: 'matildabrown@gmail.com',
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: ColorsClass.basicGrey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.profileScreen);
              },
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 14, right: 24),
                child: _drawerSection(
                  boldText: 'Personal Details',
                  greyText: 'Already have 12 orders',
                  onTap: () {
                    Get.toNamed(Routes.profileScreen);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                print('About Us');
              },
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 14, right: 24),
                child: _drawerSection(
                  boldText: 'About Us',
                  greyText: 'Lorem Ipsum is simply dummy text',
                  onTap: () {},
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                // Get.toNamed(Routes.raiseIssueScreen);
                print('Support');
              },
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 16, right: 22),
                child: _drawerSection(
                  boldText: 'Support',
                  greyText: 'Lorem Ipsum is simply dummy text',
                  onTap: () {},
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.notificationScreen);
              },
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 16, right: 22),
                child: _drawerSection(
                  boldText: 'Notification',
                  greyText: 'Lorem Ipsum is simply dummy text',
                  onTap: () {
                    Get.toNamed(Routes.notificationScreen);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                authenticationController.logout();
                print('Logout');
              },
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 16, right: 22),
                child: _drawerSection(
                  boldText: 'Logout',
                  greyText: 'Lorem Ipsum is simply dummy text',
                  onTap: () {
                    authenticationController.logout();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );*/
