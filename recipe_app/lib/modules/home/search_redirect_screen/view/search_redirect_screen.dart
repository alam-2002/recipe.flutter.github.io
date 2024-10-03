import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/utilities/constants/image_constants.dart';

import '../../bookmar_screen/view/bookmark_screen.dart';

class SearchRedirectScreen extends StatelessWidget {
  const SearchRedirectScreen({super.key});

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
        title: Label(
          label: 'Margarita Pizza',
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => BookmarkScreen());
            },
            icon: Icon(Icons.bookmark_border),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Stack(
                children: [
                  Image.asset(tomatoPizza),
                  Positioned(
                    left: 70,
                    top: 70,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6600),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_circle,
                              color: Colors.white,
                            ),
                          ),
                          Label(
                            label: 'Watch Video',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(
                      label: 'Ingredients',
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 20),
                        Label(label: 'Wheat Flour'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 20),
                        Label(label: 'Wheat Flour'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 20),
                        Label(label: 'Wheat Flour'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 20),
                        Label(label: 'Wheat Flour'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 20),
                        Label(label: 'Wheat Flour'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 20),
                        Label(label: 'Wheat Flour'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 20),
                        Label(label: 'Wheat Flour'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 20),
                        Label(label: 'Wheat Flour'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 20),
                        Label(label: 'Wheat Flour'),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(
                      label: 'Method',
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 10),
                    Label(
                      label:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      maxLines: 3,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 15),
                    Label(
                      label:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      maxLines: 3,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 15),
                    Label(
                      label:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      maxLines: 3,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => BookmarkScreen());
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(
                  Size(Get.width, 50),
                ),
                backgroundColor:
                WidgetStateProperty.all<Color>(Color(0xFFFF6600)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
              ),
              child: Text(
                'Select for Favorite',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
