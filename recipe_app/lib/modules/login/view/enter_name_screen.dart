import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/app_bar.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/login/view/miss_sir_screen.dart';
import 'package:recipe_app/theme/colors_class.dart';

class EnterNameScreen extends StatelessWidget {
  const EnterNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: '',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Label(
                label: 'What’s your name?',
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'First Name',
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
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Last Name',
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                minRadius: 30,
                backgroundColor: ColorsClass.primaryOrange,
                child: IconButton(
                  onPressed: () {
                    Get.to(() => MissSirScreen());
                  },
                  icon: Icon(Icons.arrow_forward,size: 40,),
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
