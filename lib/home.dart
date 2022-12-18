import 'package:calculator/elements/ui/styles.dart';
import 'package:calculator/elements/ui/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'elements/theme/theme_notifier.dart';
import 'elements/widget/widgets.dart';
import 'logic/functions.dart';
import "dart:math";

class MyCalculatorHomePage extends StatefulWidget {
  const MyCalculatorHomePage({super.key});

  @override
  State<MyCalculatorHomePage> createState() => _MyCalculatorHomePageState();
}

class _MyCalculatorHomePageState extends DefaultFunctions {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const AppBarTitle(),
          actions: [
            InkWell(
                onTap: () async {
                  await controller
                      .animateTo(DefaultFunctions.isLight ? 0.5 : 1);
                  DefaultFunctions.isLight = !DefaultFunctions.isLight;
                  Future.microtask(() {
                    context.read<ThemeNotifier>().changeTheme();
                  });
                  print(DefaultFunctions.isLight);
                },
                child: Lottie.asset("assets/lottie/themechanger.json",
                    repeat: false, controller: controller))
          ],
        ),
        body: Column(children: [
          CalculatingTable(calculatingTable: calculatingTable),
          ResultTable(result: result),
          Expanded(
              flex: 4,
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      InkWell(
                          onTap: () {
                            addElement("1");
                          },
                          child: DefaultNumberSection(number: 1)),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            addElement("2");
                          },
                          child: DefaultNumberSection(number: 2)),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            addElement("3");
                          },
                          child: DefaultNumberSection(number: 3)),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            evaluateCircumstances("+");
                          },
                          child: DefaultOperatorSection(element: "+")),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            evaluateCircumstances("^");
                          },
                          child: DefaultOperatorSection(element: "^"))
                    ]),
                    const Divider(height: 2),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      InkWell(
                          onTap: () {
                            addElement("4");
                          },
                          child: DefaultNumberSection(number: 4)),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            addElement("5");
                          },
                          child: DefaultNumberSection(number: 5)),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            addElement("6");
                          },
                          child: DefaultNumberSection(number: 6)),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            evaluateCircumstances("-");
                          },
                          child: DefaultOperatorSection(element: "-")),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            evaluateCircumstances("^(1/2)");
                          },
                          child: ButtonWithLogo(symbol: "root"))
                    ]),
                    const Divider(height: 2),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      InkWell(
                          onTap: () {
                            addElement("7");
                          },
                          child: DefaultNumberSection(number: 7)),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            addElement("8");
                          },
                          child: DefaultNumberSection(number: 8)),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            addElement("9");
                          },
                          child: DefaultNumberSection(number: 9)),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            evaluateCircumstances("*");
                          },
                          child: DefaultOperatorSection(element: "*")),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            evaluateCircumstances("negative");
                          },
                          child: DefaultOperatorSection(element: "+/-"))
                    ]),
                    const Divider(height: 2),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      InkWell(
                          onTap: () {
                            addElement("0");
                          },
                          child: DefaultNumberSection(number: 0)),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            addElement("00");
                          },
                          child: DefaultNumberSection(number: "00")),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            addElement(".");
                          },
                          child: DefaultNumberSection(number: ".")),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            evaluateCircumstances("/");
                          },
                          child: DefaultOperatorSection(element: "/")),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            addElement("$pi");
                          },
                          child: ButtonWithLogo(symbol: "pi"))
                    ]),
                    const Divider(height: 2),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      InkWell(
                          onTap: () {
                            calculateResult();
                          },
                          child: DefaultOperatorSection(element: "=")),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            deleteAllElement();
                          },
                          child: DefaultOperatorSection(element: "C")),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            deleteSingleElement();
                          },
                          child: ButtonWithLogo(symbol: "backspace")),
                      const Divider(indent: 2),
                      InkWell(
                          onTap: () {
                            addElement("$e");
                          },
                          child: DefaultOperatorSection(element: "e"))
                    ])
                  ])))
        ]));
  }
}
