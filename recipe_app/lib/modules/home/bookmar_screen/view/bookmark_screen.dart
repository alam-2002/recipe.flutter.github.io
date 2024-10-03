import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/app_bar.dart';
import 'package:recipe_app/commons/bottom_navigation_bar.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/home/1.home_screen/view/home_screen.dart';
import 'package:recipe_app/utilities/constants/image_constants.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: 'Your Bookmark Recipe',
        fontSize: 21,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Get.to(() => HomeScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Label(
                            label: 'Margarita pizza',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 170,
                            child: Label(
                              label:
                              'Wheat Floor, Fresh Mozzarella Cheese, Pizza sauce, Tomato sauce',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  avatar,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 8),
                              Label(
                                label: 'Nidhi Bhalla',
                                fontSize: 12,
                              ),
                            ],
                          )
                        ],
                      ),
                      Image.asset(periperiPizza),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Label(
                          label: 'Margarita pizza',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 170,
                          child: Label(
                            label:
                            'Wheat Floor, Fresh Mozzarella Cheese, Pizza sauce, Tomato sauce',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                avatar,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 8),
                            Label(
                              label: 'Nidhi Bhalla',
                              fontSize: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                    Image.asset(periperiPizza),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
