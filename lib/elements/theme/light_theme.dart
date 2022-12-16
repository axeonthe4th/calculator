import 'package:flutter/material.dart';

class ProjectTheme {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 123, 69, 216),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20)))),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
      textTheme: ThemeData.light().textTheme.copyWith(
          subtitle1: const TextStyle(fontSize: 20, color: Colors.black)));
}
