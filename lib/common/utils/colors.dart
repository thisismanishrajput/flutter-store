import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    textTheme:   TextTheme(
      titleLarge: GoogleFonts.inter(color: Colors.black), // AppBar title color
      bodyMedium: GoogleFonts.inter(color: Colors.black87), 
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
    textTheme:   TextTheme(
       titleLarge: GoogleFonts.inter(color: Colors.black),  
      bodyMedium: GoogleFonts.inter(color: Colors.black87),
    ),
    // You can add more dark theme colors if needed
  );
}
