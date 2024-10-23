import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:recipes_hub/view/navigation_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color(0xff70B9BE),
      splash: Center(
        child: Image.asset(
          'assets/images/recipehub-high-resolution-logo.png',
        ),
      ),
      nextScreen: NavigationScreen(),
    );
  }
}
