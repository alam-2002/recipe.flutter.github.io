import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/app_bar.dart';
import 'package:recipe_app/commons/bottom_navigation_bar.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/theme/colors_class.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: _notificationBox(
                    bgColor: ColorsClass.taraGreen,
                    title: 'Lorem Ipsum Proin felis',
                    time: 'Yesterday',
                    description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu at quis'),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.maxFinite,
                child: _notificationBox(
                    bgColor: ColorsClass.cinderellPink,
                    title: 'Lorem Ipsum Proin felis',
                    time: 'Yesterday',
                    description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu at quis'),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.maxFinite,
                child: _notificationBox(
                    bgColor: ColorsClass.lemonChiffon,
                    title: 'Lorem Ipsum Proin felis',
                    time: 'Yesterday',
                    description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu at quis'),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.maxFinite,
                child: _notificationBox(
                    bgColor: ColorsClass.mercuryGrey,
                    title: 'Lorem Ipsum Proin felis',
                    time: 'Yesterday',
                    description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu at quis'),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.maxFinite,
                child: _notificationBox(
                    bgColor: ColorsClass.periwinkleBlue,
                    title: 'Lorem Ipsum Proin felis',
                    time: 'Yesterday',
                    description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu at quis'),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }

  Widget _notificationBox({
    required String title,
    required String description,
    required String time,
    required Color bgColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(label:
                    title,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                    SizedBox(height: 8),
                    Label(label:
                    description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: ColorsClass.basicGrey,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 28),
          Label(label:
          time,
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: ColorsClass.greyShade600,
          ),
        ],
      ),
    );
  }
}



