import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  static const Color backgroundColor = Color(0xFF090C21);
  static const Color appBarColor = Color(0xFF0A0D22);
  static const Color cardColor = Color(0xFF1D1F33);
  static const Color buttonColor = Color(0xFFEB1555);

 static ThemeData themeGlobal() {
    return ThemeData(
        scaffoldBackgroundColor: ThemeApp.backgroundColor,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          centerTitle: true,
          backgroundColor: ThemeApp.appBarColor,
          elevation: 0,
        ),
        backgroundColor: ThemeApp.backgroundColor,
        primaryColor: Colors.grey,
      );
  }
}
