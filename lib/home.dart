import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyCalculatorHomePage extends StatefulWidget {
  const MyCalculatorHomePage({super.key});

  @override
  State<MyCalculatorHomePage> createState() => _MyCalculatorHomePageState();
}

class _MyCalculatorHomePageState extends State<MyCalculatorHomePage> {
  late String calculatingTable;
  final String symbols = "+-*/";
  final String numbers = "0123456789";
  late dynamic result;

  @override
  void initState() {
    super.initState();
    calculatingTable = "";
    result = "";
  }

  void addElement(String element) {
    setState(() {
      calculatingTable += element;
    });
  }

  void deleteAllElement() {
    setState(() {
      calculatingTable = "";
    });
  }

  void deleteSingleElement() {
    setState(() {
      calculatingTable != ""
          ? calculatingTable =
              calculatingTable.substring(0, calculatingTable.length - 1)
          : true;
    });
  }

  void evaluateCircumstances(String operator) {
    calculatingTable.isEmpty
        ? addElement(operator)
        : (symbols.contains(calculatingTable[calculatingTable.length - 1])
            ? replaceElement(operator)
            : addElement(operator));
  }

  void replaceElement(String element) {
    setState(() {
      if (symbols.contains(element) &&
          symbols.contains(calculatingTable[calculatingTable.length - 1])) {
        List<String> tempTable = calculatingTable.split("");
        tempTable.removeLast();
        tempTable.add(element);
        String calculatingTable2 = "";
        for (int i = 0; i < tempTable.length; i++) {
          calculatingTable2 += tempTable[i];
        }
        calculatingTable = calculatingTable2;
      }
    });
  }

  void calculateResult() {
    // calculatingTable = calculatingTable.replaceAll('×', '*');
    // calculatingTable = calculatingTable.replaceAll('÷', '/');
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(calculatingTable);

        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        result = "not completed";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Calculator")),
        ),
        body: Column(children: [
          Expanded(
              flex: 2,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: Container(
                        color: Colors.white,
                        child: Center(
                            child: Text(
                          calculatingTable,
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(
                                  fontSize: 50, fontWeight: FontWeight.w300),
                        ))))
              ])),
          Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                result ?? "",
                style: result is int
                    ? Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 50, fontWeight: FontWeight.w300)
                    : Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 37, fontWeight: FontWeight.w300),
              ))),
          Expanded(
              flex: 4,
              child: Container(
                  color: Colors.deepPurple,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(children: [
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
                              child: DefaultOperatorSection(element: "+"))
                        ]),
                        const Divider(height: 2),
                        Row(children: [
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
                              child: DefaultOperatorSection(element: "-"))
                        ]),
                        const Divider(height: 2),
                        Row(children: [
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
                        ]),
                        const Divider(height: 2),
                        Row(children: [
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
                        ]),
                        const Divider(height: 2),
                        Row(children: [
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
                                  icon: const Icon(Icons.backspace_outlined)))
                        ]),
                      ])))
        ]));
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
            child: Text(element,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 30, fontWeight: FontWeight.w300))));
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
            child: Text("$number",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 30, fontWeight: FontWeight.w300))));
  }
}
