import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:recipe_app/modules/login/controller/authentication_controller.dart';
import 'package:recipe_app/modules/login/controller/user_controller.dart';
import 'package:recipe_app/modules/login/model/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authController = Get.put(AuthenticationController());
  final _userController = Get.put(UserController());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getUserDataYT() {
    final email = _authController.firebaseUser.value?.email;
    if(email != null){
      return _userController.getUserDetails(email);
    }
    else {
      Get.snackbar('Error', 'Something Wrong');
    }
  }

  //------------------------------//
  // Method to fetch user data from Firestore using FirebaseAuth
  Future<UserModel?> getUserData() async {
    try {
      // Get the current user from Firebase Authentication
      User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception("No user logged in");
      }

      String userId = currentUser.uid;

      // Fetch user data from Firestore using userId
      DocumentSnapshot doc = await _firestore.collection('Users').doc(userId).get();

      if (doc.exists) {
        return UserModel.fromFirestore(doc);
      } else {
        throw Exception("User data not found in Firestore");
      }
    } catch (e) {
      print(e);
      return null; // Return null on error
    }
  }
}
