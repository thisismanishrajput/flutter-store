import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF7E57C2);
  static const secondary = Color(0xFF6c757d);
  static const accent = Color(0xFF6200EA); // Accent color for both light and dark themes

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.black,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black), // AppBar title color
      bodyMedium: TextStyle(color: Colors.black87), // Body text color
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white), // AppBar title color
      bodyMedium: TextStyle(color: Colors.white70), // Body text color
    ),
    // You can add more dark theme colors if needed
  );
}
