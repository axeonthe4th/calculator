import 'package:calculator/elements/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/functions.dart';
import '../theme/theme_notifier.dart';
import '../ui/images.dart';
import '../ui/styles.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Calculator", style: TextStyles.titleTextStyle);
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
        child: Center(
            child: Text(calculatingTable,
                style: TextStyles.tableTextStyle.copyWith(
                    color: context.watch<ThemeNotifier>().currentColor))));
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
            child: Text(result ?? "",
                style: TextStyles.resultTextStyle.copyWith(
                    color: context.watch<ThemeNotifier>().currentColor))));
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
        decoration: BoxDecoration(
            color: DefaultFunctions.isLight
                ? ProjectColors.lightButtonColor
                : ProjectColors.darkButtonColor,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2, offset: Offset(2, 2), color: Colors.black)
            ]),
        child:
            Center(child: Text(element, style: TextStyles.operatorTextStyle)));
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
        decoration: BoxDecoration(
            color: DefaultFunctions.isLight
                ? ProjectColors.lightPrimaryColor
                : ProjectColors.darkPrimaryColor,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2, offset: Offset(2, 2), color: Colors.black)
            ]),
        child: Center(
            child: Text("$number",
                style: TextStyles.numberTextStyle.copyWith(
                    color: context.watch<ThemeNotifier>().currentColor))));
  }
}

class ButtonWithLogo extends StatelessWidget {
  ButtonWithLogo({Key? key, required this.symbol}) : super(key: key);

  late String symbol;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: DefaultFunctions.isLight
                ? ProjectColors.lightButtonColor
                : ProjectColors.darkButtonColor,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2, offset: Offset(2, 2), color: Colors.black)
            ]),
        height: 75,
        width: 75,
        child: symbol == "root"
            ? (DefaultFunctions.isLight
                ? Images.rootImageDark
                : Images.rootImageLight)
            : (symbol == "pi"
                ? (DefaultFunctions.isLight
                    ? Images.piImageDark
                    : Images.piImageLight)
                : const Icon(Icons.backspace_outlined)));
  }
}
