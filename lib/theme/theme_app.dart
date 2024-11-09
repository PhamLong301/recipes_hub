import 'package:flutter/material.dart';

class ThemeApp {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff70B9BE),
    appBarTheme: const AppBarTheme(color: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: '',
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontSize: 30,
        )),
  );
  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[800],
    appBarTheme: const AppBarTheme(color: Colors.grey),
    scaffoldBackgroundColor: Colors.grey,
    fontFamily: '',
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontSize: 30,
        )),
  );
}