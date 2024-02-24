import 'package:flutter/material.dart';

class AppTheme {

  static const Color primaryColor = Color(0xFF2A75BC);

  static final lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
    ),
  );

}