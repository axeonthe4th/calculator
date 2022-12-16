import 'package:calculator/home.dart';
import 'package:flutter/material.dart';
import 'elements/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ProjectTheme.lightTheme,
      home: MyCalculatorHomePage(),
    );
  }
}
