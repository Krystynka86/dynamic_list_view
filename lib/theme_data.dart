import 'package:flutter/material.dart';
import 'app_colors.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.lightMode,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.darkMode,
    brightness: Brightness.dark,
  );
}
