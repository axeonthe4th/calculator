import 'package:flutter/material.dart';

import 'themes.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = false;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme =>
      isLightTheme ? ProjectTheme.lightTheme : ProjectTheme.darkTheme;
  Color get currentColor => isLightTheme ? Colors.black : Colors.white;
}
