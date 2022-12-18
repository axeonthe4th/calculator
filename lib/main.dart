import 'package:calculator/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'elements/theme/themes.dart';
import 'elements/theme/theme_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(),
      )
    ],
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: MyCalculatorHomePage(),
    );
  }
}
