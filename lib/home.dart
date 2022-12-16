import 'package:calculator/elements/text/texts.dart';
import 'package:flutter/material.dart';
import 'elements/widget/widgets.dart';
import 'logic/functions.dart';

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
          title: const AppBarTitle(),
        ),
        body: Column(children: [
          CalculatingTable(calculatingTable: calculatingTable),
          ResultTable(result: result),
          Expanded(
              flex: 4,
              child: Container(
                  color: Colors.deepPurple,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                    evaluateCircumstances("+");
                                  },
                                  child: DefaultOperatorSection(element: "sin"))
                            ]),
                        const Divider(height: 2),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                    evaluateCircumstances("+");
                                  },
                                  child: DefaultOperatorSection(element: "cos"))
                            ]),
                        const Divider(height: 2),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                    addElement("000");
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
                                    evaluateCircumstances("+");
                                  },
                                  child: DefaultOperatorSection(element: "tan"))
                            ]),
                        const Divider(height: 2),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                              Container(
                                  color: Colors.white,
                                  height: 75,
                                  width: 75,
                                  child: IconButton(
                                      onPressed: () {
                                        deleteSingleElement();
                                      },
                                      icon: const Icon(
                                          Icons.backspace_outlined))),
                              const Divider(indent: 2),
                              InkWell(
                                  onTap: () {
                                    evaluateCircumstances("+");
                                  },
                                  child: DefaultOperatorSection(element: "cot"))
                            ])
                      ])))
        ]));
  }
}
