import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the light theme for the application
      theme: MyAppThemes.lightTheme,
      // Set the dark theme for the application
      darkTheme: MyAppThemes.darkTheme,
      themeMode: ThemeMode.system, // Default mode
      home: const MyHomePage(),
    );
  }
}
