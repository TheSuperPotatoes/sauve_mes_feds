import 'package:flutter/material.dart';

final ThemeData mainTheme = ThemeData(
    fontFamily: "Outfit",
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromARGB(255, 215, 233, 255),
      tertiary: Color.fromARGB(255, 25, 43, 97),
      error: Color.fromARGB(255, 252, 65, 65),
      background: Color.fromARGB(251, 228, 228, 228),
      onPrimary: Color.fromARGB(0, 255, 231, 0),
      onSecondary: Color.fromARGB(185, 158, 158, 255),
      onTertiary: Color.fromARGB(0, 255, 231, 0),
      onError: Color.fromARGB(0, 255, 231, 0),
      onBackground: Color.fromARGB(255, 255, 231, 255),
      surface: Color.fromARGB(0, 255, 231, 0),
      onSurface: Color.fromARGB(0, 255, 231, 0),
    ),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color.fromARGB(255, 43, 52, 103)),
        headlineMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color.fromARGB(255, 43, 52, 103)),
        headlineSmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Color.fromARGB(255, 43, 52, 103)),
        titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 43, 52, 103)),
        bodyLarge: TextStyle(
            fontSize: 28, fontWeight: FontWeight.w500, color: Colors.black),
        bodyMedium: TextStyle(
            fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
        labelMedium: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 141, 156, 173)),
        labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 141, 156, 173))));

final ThemeData specialTheme = ThemeData();
