import 'package:flutter/material.dart';

class CustomsThemes {
  CustomsThemes();
  static final defaultThemeData = ThemeData(primaryColor: Colors.red),
      lightThemeData = defaultThemeData.copyWith(primaryColor: Colors.green),
      darkThemeData = defaultThemeData.copyWith(primaryColor: Colors.black);
}
