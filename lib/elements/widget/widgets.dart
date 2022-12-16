import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../text/texts.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Texts.titleText);
  }
}

class CalculatingTable extends StatelessWidget {
  const CalculatingTable({Key? key, required this.calculatingTable})
      : super(key: key);

  final String calculatingTable;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
            color: Colors.white,
            child: Center(
                child: Text(calculatingTable,
                    style: GoogleFonts.assistant(fontSize: 35)))));
  }
}

class ResultTable extends StatelessWidget {
  ResultTable({Key? key, required this.result}) : super(key: key);

  dynamic result;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Center(
            child: Text(result ?? "", style: TextStyles.resultTextStyle)));
  }
}

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
