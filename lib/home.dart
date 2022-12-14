import 'dart:io';
import "dart:math";
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
  late var result;

  @override
  void initState() {
    super.initState();
    calculatingTable = "";
    result = "";
  }

  void addElement(String element) {
    calculatingTable += element;
  }

  void deleteElement() {
    calculatingTable = "";
  }

  void replaceElement(String element) {
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
  }

  void calculateResult() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(calculatingTable);

      ContextModel cm = ContextModel();
      result = '${exp.evaluate(EvaluationType.REAL, cm)}';
    } catch (e) {
      result = "not completed";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Calculator")),
      ),
      body: Column(children: [
        Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      calculatingTable,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(fontSize: 50, fontWeight: FontWeight.w400),
                    ))),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.amber,
            child: Center(
                child: Text(
              result ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontSize: 50, fontWeight: FontWeight.w400),
            )),
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            addElement("0");
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text("0",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400)))),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            addElement("1");
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text("1",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400)))),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            addElement("2");
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text("2",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400)))),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            addElement("3");
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text("3",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400)))),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            addElement("4");
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text("4",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400)))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            addElement("5");
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text("5",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400)))),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            addElement("6");
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text("6",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400)))),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            addElement("7");
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text("7",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400)))),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            addElement("8");
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text("8",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400)))),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            addElement("9");
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text("9",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400)))),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.deepPurple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              calculatingTable.length == 0
                                  ? addElement("+")
                                  : (symbols.contains(calculatingTable[
                                          calculatingTable.length - 1])
                                      ? replaceElement("+")
                                      : addElement("+"));
                            });
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.white,
                              child: Center(
                                  child: Text("+",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w400))))),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              calculatingTable.length == 0
                                  ? addElement("-")
                                  : (symbols.contains(calculatingTable[
                                          calculatingTable.length - 1])
                                      ? replaceElement("-")
                                      : addElement("-"));
                            });
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.white,
                              child: Center(
                                  child: Text("-",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w400))))),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              calculatingTable.length == 0
                                  ? addElement("*")
                                  : (symbols.contains(calculatingTable[
                                          calculatingTable.length - 1])
                                      ? replaceElement("*")
                                      : addElement("*"));
                            });
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.white,
                              child: Center(
                                  child: Text("*",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w400))))),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              calculatingTable.length == 0
                                  ? addElement("/")
                                  : (symbols.contains(calculatingTable[
                                          calculatingTable.length - 1])
                                      ? replaceElement("/")
                                      : addElement("/"));
                            });
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.white,
                              child: Center(
                                  child: Text("/",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w400))))),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              calculateResult();
                            });
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.white,
                              child: Center(
                                  child: Text("=",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w400))))),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            deleteElement();
                          });
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                                child: Text("C",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400)))),
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer()
                ],
              ),
            )),
      ]),
    );
  }
}

// Expanded(
//   flex: 5,
//   child: Column(
//     children: [
//       Align(
//         alignment: Alignment.centerLeft,
//         child: Container(
//           height: 300,
//           width: 300,
//           color: Colors.cyan,
//         ),
//       )
//     ],
//   ),
// )

// if (symbols.contains(element) &&
//         symbols.contains(calculatingTable[calculatingTable.length - 1])) {
//       calculatingTable[calculatingTable.length - 1].endsWith(other)
//     }

