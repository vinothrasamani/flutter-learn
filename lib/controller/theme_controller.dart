import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeController {
  Color secondaryColor = const Color.fromARGB(255, 0, 67, 121);
  Color baseColor = Colors.blue;
  ThemeData lightTheme() => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: baseColor),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
          ),
        ),
        fontFamily: GoogleFonts.roboto().fontFamily,
      );
}
