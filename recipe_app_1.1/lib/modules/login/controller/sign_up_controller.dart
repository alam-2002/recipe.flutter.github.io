import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/modules/login/controller/authentication_controller.dart';
import 'package:recipe_app/modules/login/controller/user_controller.dart';
import 'package:recipe_app/modules/login/model/user_model.dart';
import 'package:recipe_app/modules/login/view/email_login_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final userController = Get.put(UserController());

  void createUser(UserModel user) {
    userController.createUser(user);
    registerUser(email: user.email, password: user.password);
    Get.to(() => EmailLoginScreen());
  }

  void registerUser({required String email, required String password}) {
    AuthenticationController.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }
}
