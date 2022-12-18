import 'package:flutter/material.dart';

class ProjectTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
        color: ProjectColors.lightPrimaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
    scaffoldBackgroundColor: ProjectColors.lightSecondaryColor,
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
        color: ProjectColors.darkPrimaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
    scaffoldBackgroundColor: ProjectColors.darkSecondaryColor,
  );
}

class ProjectColors {
  static Color darkPrimaryColor = const Color.fromARGB(255, 81, 45, 143);
  static Color darkSecondaryColor = const Color.fromARGB(255, 47, 47, 47);
  static Color darkButtonColor = const Color.fromARGB(255, 21, 21, 21);
  static Color lightPrimaryColor = const Color.fromARGB(255, 123, 69, 216);
  static Color lightSecondaryColor = const Color.fromARGB(255, 229, 229, 229);
  static Color lightButtonColor = const Color.fromARGB(255, 186, 186, 186);
}
