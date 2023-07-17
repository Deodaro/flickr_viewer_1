import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepOrange,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 54, 54, 54),
  useMaterial3: true,
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
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.amber,
  ),
);
