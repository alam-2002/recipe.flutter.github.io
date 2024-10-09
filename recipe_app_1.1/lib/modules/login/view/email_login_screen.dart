import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/app_bar.dart';
import 'package:recipe_app/commons/rectangular_botton.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/login/controller/authentication_controller.dart';
import 'package:recipe_app/navigation/routes.dart';
import 'package:recipe_app/theme/colors_class.dart';

class EmailLoginScreen extends StatelessWidget {
  EmailLoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authenticationController = Get.put(AuthenticationController());
  Rx<bool> _isObscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Label(
          label: 'Login',
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Label(
                  label: 'Let’s Start With Your',
                  fontSize: 22,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Label(
                  label: 'Email',
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              //email
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //password
              Obx(
                () => TextField(
                  obscureText: _isObscureText.value,
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _isObscureText.value = !_isObscureText.value;
                      },
                      icon: _isObscureText.value
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    hintText: 'Password',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Label(
                        label: 'Forgot Password?',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.forgetPasswordScreen);
                        },
                        child: Label(
                          label: 'Reset',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: ColorsClass.primaryOrange,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Label(
                        label: 'New User?',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.registrationScreen);
                        },
                        child: Label(
                          label: 'Registration',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
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
            onPressed: () {
              AuthenticationController.instance.loginWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
            },
            title: 'Login',
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}


