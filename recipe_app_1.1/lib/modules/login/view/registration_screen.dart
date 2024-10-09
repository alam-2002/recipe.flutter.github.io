import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/rectangular_botton.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/login/controller/sign_up_controller.dart';
import 'package:recipe_app/modules/login/model/user_model.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final signUpController = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
  Rx<bool> _isObscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Label(
          label: 'Sign Up',
          fontWeight: FontWeight.w900,
          fontSize: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Label(
                  label: 'Let’s Start With Your',
                  fontSize: 22,
                ),
                Label(
                  label: 'Registration',
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 20),

                //User Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 155,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        // First Name
                        child: TextFormField(
                          controller: signUpController.firstNameController,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'First Name',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 155,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        // Last Name
                        child: TextFormField(
                          controller: signUpController.lastNameController,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Last Name',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                //email
                TextFormField(
                  controller: signUpController.emailController,
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
                  () => TextFormField(
                    obscureText: _isObscureText.value,
                    controller: signUpController.passwordController,
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

                // confirm password
                Obx(
                  () => TextFormField(
                    obscureText: _isObscureText.value,
                    controller: signUpController.confirmPasswordController,
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
                      hintText: 'Confirm Password',
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RectangularButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // SignUpController.instance.registerUser(
                //     email: signUpController.emailController.text.trim(),
                //     password:
                //         signUpController.passwordController.text.trim());

                final user = UserModel(
                  firstName: signUpController.firstNameController.text.trim(),
                  lastName: signUpController.lastNameController.text.trim(),
                  email: signUpController.emailController.text.trim(),
                  password: signUpController.passwordController.text.trim(),
                );
                SignUpController.instance.createUser(user);
              }
              // Get.to(() => EmailLoginScreen());
              // Get.toNamed(Routes.missSirScreen);
            },
            title: 'Sign Up',
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}


