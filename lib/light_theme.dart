import 'package:flutter/material.dart';

class LightTheme {
  ThemeData theme = ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.8),
      buttonTheme: const ButtonThemeData(
        colorScheme: ColorScheme.light(
            onPrimary: Colors.deepPurple, onSecondary: Colors.cyan),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple),
      textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: const TextStyle(fontSize: 20, color: Colors.black),
          ),
      checkboxTheme: CheckboxThemeData(
        side: const BorderSide(
          color: Colors.green,
        ),
        fillColor: MaterialStateProperty.all(Colors.green),
      ),
      listTileTheme: ListTileThemeData(tileColor: Colors.grey.shade500));
}
