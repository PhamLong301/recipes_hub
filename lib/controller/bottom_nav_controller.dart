import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_hub/view/main_screens/favorite_screen.dart';
import 'package:recipes_hub/view/main_screens/home_screen.dart';
import 'package:recipes_hub/view/main_screens/search_screen.dart';
import 'package:recipes_hub/view/main_screens/setting_screen.dart';

class BottomNavigationController extends GetxController{
  RxInt indexScreen = 0.obs;

  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ];

  void changeScreen(int index){
    indexScreen.value = index;
  }

  Widget get currentScreen => pages[indexScreen.value];
}