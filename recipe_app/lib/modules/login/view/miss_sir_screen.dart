import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/app_bar.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/login/view/phone_login_screen.dart';
import 'package:recipe_app/theme/colors_class.dart';


class MissSirScreen extends StatelessWidget {
  const MissSirScreen({super.key});

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
                label: 'How would you like to be address?',
                maxLines: 2,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              SizedBox(height: 30),
              TextField(
                onTap: (){},
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Miss/Madam',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusColor: Colors.grey,
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
                onTap: (){},
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Sir',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
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
                onTap: (){},
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "I'd rather not say",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
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
                    Get.to(() => PhoneLoginScreen());
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
