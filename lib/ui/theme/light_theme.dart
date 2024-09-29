import 'package:flutter/material.dart';

const mainColor = Color.fromARGB(255, 67, 95, 180);

var lightTheme = ThemeData(
  fontFamily: 'Montserrat',
  cardColor: Colors.white,
  dividerTheme: DividerThemeData(color: Colors.grey.withOpacity(0.3)),
  secondaryHeaderColor: Colors.black,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: mainColor,
      fontSize: 23,
      fontWeight: FontWeight.w600,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
  disabledColor: Colors.white,
  primaryColor: mainColor,
  colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
);

var darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.grey,
    foregroundColor: Colors.grey,
  ),
  cardColor: Colors.grey.withOpacity(0.1),
  secondaryHeaderColor: Colors.white,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: mainColor,
      fontSize: 23,
      fontWeight: FontWeight.w600,
    ),
  ),
  scaffoldBackgroundColor: Colors.grey,
  useMaterial3: true,
  disabledColor: Colors.white,
  primaryColor: mainColor,
  colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
);
