import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultOperatorSection extends StatelessWidget {
  DefaultOperatorSection({Key? key, required this.element}) : super(key: key);

  late String element;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        width: element == "=" ? 152 : 75,
        color: Colors.white,
        child: Center(
            child: Text(element, style: GoogleFonts.assistant(fontSize: 40))));
  }
}

class DefaultNumberSection extends StatelessWidget {
  DefaultNumberSection({Key? key, required this.number}) : super(key: key);

  late dynamic number;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        width: 75,
        color: Colors.orange,
        child: Center(
            child:
                Text("$number", style: GoogleFonts.assistant(fontSize: 40))));
  }
}
