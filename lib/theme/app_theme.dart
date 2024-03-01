import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.blue;

  static final lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
