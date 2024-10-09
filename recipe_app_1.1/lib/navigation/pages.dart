import 'package:get/get.dart';
import 'package:recipe_app/navigation/routes.dart';
import 'package:recipe_app/modules/home/1.home_screen/view/home_screen.dart';
import 'package:recipe_app/modules/home/bookmark_screen/view/bookmark_screen.dart';
import 'package:recipe_app/modules/home/latest_recipes_screen/view/latest_recipe_screen.dart';
import 'package:recipe_app/modules/home/notification_screen/view/notification_screen.dart';
import 'package:recipe_app/modules/home/profile_screen/view/user_profile_screen.dart';
import 'package:recipe_app/modules/home/search_redirect_screen/view/search_redirect_screen.dart';
import 'package:recipe_app/modules/login/view/email_login_screen.dart';
import 'package:recipe_app/modules/login/view/forget_password.dart';
import 'package:recipe_app/modules/login/view/registration_screen.dart';
import 'package:recipe_app/modules/login/view/splash_screen.dart';

class Pages {

  static List<GetPage> getPages = [

    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
    ),

    GetPage(
      name: Routes.emailLoginScreen,
      page: () => EmailLoginScreen(),
    ),

    GetPage(
      name: Routes.registrationScreen,
      page: () => RegistrationScreen(),
    ),

    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgetPassword(),
    ),

    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
    ),

    GetPage(
      name: Routes.latestRecipeScreen,
      page: () => LatestRecipeScreen(),
    ),

    GetPage(
      name: Routes.searchRedirectScreen,
      page: () => SearchRedirectScreen(),
    ),

    GetPage(
      name: Routes.bookmarkScreen,
      page: () => BookmarkScreen(),
    ),

    GetPage(
      name: Routes.profileScreen,
      page: () => MyProfileScreen(),
    ),

    GetPage(
      name: Routes.notificationScreen,
      page: () => NotificationScreen(),
    ),

  ];
}
