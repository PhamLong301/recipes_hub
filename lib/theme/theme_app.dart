import 'package:flutter/material.dart';

class ThemeApp {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    appBarTheme: const AppBarTheme(color: Colors.orangeAccent),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
        titleLarge: TextStyle(
          fontSize: 30,
        )),
  );
  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[800],
    appBarTheme: const AppBarTheme(color: Colors.deepOrange),
    scaffoldBackgroundColor: Colors.grey,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
        titleLarge: TextStyle(
          fontSize: 30,
        )),
  );
}