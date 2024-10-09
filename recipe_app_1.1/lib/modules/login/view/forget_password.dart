import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/rectangular_botton.dart';
import 'package:recipe_app/commons/text_field.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/navigation/routes.dart';
import 'package:recipe_app/theme/colors_class.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  // FirebaseController firebaseController = Get.put(FirebaseController());
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Label(label: ''),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Label(
                  label: 'Confirm Your Registered Email',
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 30),

              //email text field
              UserInputTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter Your Email Address',
              ),
              SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Label(
                        label: 'Go to',
                        fontWeight: FontWeight.w500,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.emailLoginScreen);
                        },
                        child: Label(
                          label: 'Login',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: ColorsClass.primaryOrange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RectangularButton(
            onPressed: () /*async*/ {
              showCenteredToast(
                  context, "Link has been send to your registered email");
              // firebaseController.resetPassword(
              //   email: emailController.text,
              // );
            },
            title: 'Reset Password',
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void showCenteredToast(BuildContext context, String message) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Label(
                  label: message,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 5))
        .then((_) => overlayEntry.remove());
  }
}
