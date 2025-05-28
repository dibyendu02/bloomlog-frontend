import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.green,
  inputDecorationTheme: InputDecorationTheme(fillColor: Colors.grey.shade200),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF0F1E18),
  primarySwatch: Colors.green,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.green.shade900.withOpacity(0.3),
  ),
);
