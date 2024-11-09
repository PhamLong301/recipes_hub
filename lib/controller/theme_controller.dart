import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_app.dart';

class ThemeController extends GetxController {
  RxBool isDarkTheme = false.obs;

  void toggleTheme() async {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeTheme(isDarkTheme.value ? ThemeApp.light : ThemeApp.dark);
    saveTheme(isDarkTheme.value);
  }

  void saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', isDark);
  }


  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkTheme.value = prefs.getBool('isDarkTheme') ?? false;
    Get.changeTheme(isDarkTheme.value ? ThemeApp.light : ThemeApp.dark);
  }

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }
}
