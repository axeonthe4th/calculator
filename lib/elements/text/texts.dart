import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calculator/logic/functions.dart';

abstract class Texts extends DefaultFunctions {
  static Text titleText =
      Text("Calculator", style: GoogleFonts.assistant(fontSize: 30));
}
