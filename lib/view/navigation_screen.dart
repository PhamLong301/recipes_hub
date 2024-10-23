import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_hub/controller/bottom_nav_controller.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes Hub'),
      ),
      body: SafeArea(
        child: Obx(() => bottomNavigationController.currentScreen),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: bottomNavigationController.indexScreen.value,
          onTap: (index) {
            bottomNavigationController.changeScreen(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Color(0xff70B9BE),
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
