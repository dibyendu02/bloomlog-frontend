import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  fontFamily: 'Montserrat',
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.green,
  inputDecorationTheme: InputDecorationTheme(fillColor: Colors.white),
);

final darkTheme = ThemeData(
  fontFamily: 'Montserrat',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF0F1E18),
  primarySwatch: Colors.green,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.green.shade900.withOpacity(0.3),
  ),
);
