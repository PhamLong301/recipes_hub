import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../view/authentication_screen/sign_in_screen.dart';
import 'package:recipes_hub/view/main_screens/home_screen.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> register(String email, String password, ) async {
    try {
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.back();
      Get.offAll(() => SignInScreen());
    } catch (e) {
      Get.back();
      Get.snackbar("Lỗi đăng ký", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.back();
      Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.back();
      Get.snackbar("error".tr, e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    Get.offAll(() => HomeScreen());
  }

  @override
  void onReady() {
    super.onReady();
    auth.authStateChanges().listen((User? user) {
      if(user != null){
        Get.offAll(() => const HomeScreen());
        }
    });
  }
}
