import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 54, 54, 54),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 20,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
    textColor: Colors.white,
  ),
);
