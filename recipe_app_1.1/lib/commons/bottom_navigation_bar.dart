import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/modules/home/bookmark_screen/controller/bookmark_controller.dart';
import 'package:recipe_app/modules/home/bookmark_screen/view/bookmark_screen.dart';
import 'package:recipe_app/modules/home/profile_screen/view/user_profile_screen.dart';
import 'package:recipe_app/navigation/routes.dart';
import 'package:recipe_app/theme/colors_class.dart';

class MyNavigationBar extends StatelessWidget {
  MyNavigationBar({super.key});

  final NavigationController navigationController = Get.put(NavigationController());
  final BookmarkController bookmarkController = Get.put(BookmarkController());

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
          backgroundColor: ColorsClass.primaryOrange,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            navigationController.changeIndex(index);
          },
          currentIndex: navigationController.selectedIndex.value,
          items: const [
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

  void changeIndex(int index) async {
    selectedIndex.value = index;

    if (selectedIndex == 0) {
      Get.toNamed(Routes.homeScreen);
    } else if (selectedIndex == 1) {
      await Get.toNamed(Routes.bookmarkScreen);
      // Get.to(() => BookmarkScreen());
      // await Get.to(() => BookmarkScreen());
    } else if (selectedIndex == 2) {
      Get.toNamed(Routes.profileScreen);
      Get.to(() => MyProfileScreen());
    }
  }

}
