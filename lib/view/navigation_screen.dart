import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_hub/controller/navigation_controller.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Recipes Hub'),
      // ),
      body: SafeArea(
        child: Obx(() => navigationController.currentScreen),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navigationController.indexScreen.value,
          onTap: (index) {
            navigationController.changeScreen(index);
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
