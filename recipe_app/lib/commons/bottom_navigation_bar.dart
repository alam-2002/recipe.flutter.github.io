import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/modules/home/1.home_screen/view/home_screen.dart';
import 'package:recipe_app/modules/home/bookmar_screen/view/bookmark_screen.dart';
import 'package:recipe_app/modules/home/profile_screen/view/user_profile_screen.dart';



class MyNavigationBar extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());
  MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Obx(
        () => BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFFF6600),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            navigationController.changeIndex(index);
          },
          currentIndex: navigationController.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/homeIcon.png')),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/bookmarkIcon.png')),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/profileIcon.png')),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;

    if (selectedIndex == 0) {
      // Get.toNamed(Routes.homeScreen);
      Get.to(() => HomeScreen());
    } else if (selectedIndex == 1) {
      // Get.toNamed(Routes.bookingScreenMain);
      Get.to(() => BookmarkScreen());
    } else if (selectedIndex == 2) {
      // Get.toNamed(Routes.notificationScreen);
      Get.to(() => MyProfileScreen());
    }
  }
}
