import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calculator/logic/functions.dart';

abstract class Texts extends DefaultFunctions {
  static Text titleText = Text("Calculator", style: TextStyles.titleTextStyle);
}

class TextStyles {
  static TextStyle titleTextStyle = GoogleFonts.assistant(fontSize: 30);
  static TextStyle resultTextStyle = GoogleFonts.assistant(fontSize: 35);
}
