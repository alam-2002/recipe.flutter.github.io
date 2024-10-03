import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/home/search_redirect_screen/view/search_redirect_screen.dart';
import 'package:recipe_app/utilities/constants/image_constants.dart';

class LatestRecipeScreen extends StatelessWidget {
  const LatestRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'Search Recipe',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(30),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Label(
                label: 'Latest recipes “Margarita pizza”',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Get.to(() => SearchRedirectScreen());
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
    );
  }
}
