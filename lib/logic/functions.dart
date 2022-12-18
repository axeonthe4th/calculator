import 'dart:developer';
import 'dart:math';

import "package:flutter/material.dart";
import 'package:math_expressions/math_expressions.dart';
import '../home.dart';

abstract class DefaultFunctions extends State<MyCalculatorHomePage>
    with TickerProviderStateMixin {
  late String calculatingTable;
  final String symbols = "+-*/^";
  final String numbers = "0123456789";
  late dynamic result;
  late final AnimationController controller;
  static bool isLight = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    calculatingTable = "";
    result = "";
  }

  void addElement(String element) {
    setState(() {
      if (numbers.contains(element) &&
          calculatingTable.startsWith("-(") &&
          calculatingTable.endsWith(")")) {
        true;
      } else if (element == "." &&
          (calculatingTable.isEmpty ||
              calculatingTable.endsWith(".") ||
              (calculatingTable.length >= 3 &&
                  calculatingTable[calculatingTable.length - 2] == ".") ||
              symbols.contains(calculatingTable[calculatingTable.length - 1]) ||
              "()".contains(calculatingTable[calculatingTable.length - 1]) ||
              calculatingTable.endsWith("2.71") ||
              calculatingTable.endsWith("3.14"))) {
        true;
      } else if (calculatingTable.endsWith(")")) {
        true;
      } else if ((element == "$pi" || element == "$e") &&
          (calculatingTable.endsWith("2.71") ||
              calculatingTable.endsWith("3.14"))) {
        true;
      } else if (element == "$pi" || element == "$e") {
        calculatingTable += element.substring(0, 4);
      } else {
        calculatingTable += element;
      }
    });
  }

  void deleteAllElement() {
    setState(() {
      calculatingTable = "";
    });
  }

  void deleteSingleElement() {
    setState(() {
      if (calculatingTable.endsWith("^(1/2)")) {
        calculatingTable =
            calculatingTable.substring(0, calculatingTable.length - 6);
      } else if (calculatingTable.startsWith("-(") &&
          calculatingTable.endsWith(")")) {
        calculatingTable =
            calculatingTable.substring(0, calculatingTable.length - 1);
        calculatingTable = calculatingTable.substring(2);
      } else if (calculatingTable != "") {
        calculatingTable =
            calculatingTable.substring(0, calculatingTable.length - 1);
      } else {
        true;
      }
    });
  }

  void evaluateCircumstances(String operator) {
    if ((calculatingTable.isEmpty || symbols.contains(calculatingTable[0])) &&
        ((calculatingTable.isEmpty &&
            (operator == "+" || operator == "*" || operator == "/")))) {
      true;
    } else if (calculatingTable.isEmpty) {
      operator != "negative" ? addElement(operator) : true;
    } else if (calculatingTable[0] == "-" && calculatingTable.length == 1) {
      if (symbols.contains(operator)) {
        if (symbols.contains(calculatingTable[calculatingTable.length - 1])) {
          if (calculatingTable.length > 1) {
            replaceElement(operator);
          } else {
            true;
          }
        } else if (numbers
            .contains(calculatingTable[calculatingTable.length - 1])) {
          addElement(operator);
        }
      } else if (numbers.contains(operator)) {
        addElement(operator);
      }
    } else if (calculatingTable.isNotEmpty &&
        symbols.contains(calculatingTable[calculatingTable.length - 1])) {
      replaceElement(operator);
    } else if (operator == "negative" && calculatingTable.isNotEmpty) {
      String tempString = "-(";
      if (calculatingTable[0] == "-" &&
          calculatingTable[1] == "(" &&
          calculatingTable.endsWith("^(1/2)")) {
        setState(() {
          tempString += calculatingTable;
          tempString += ")";
          calculatingTable = tempString;
        });
      } else if (calculatingTable[0] == "-" &&
          calculatingTable[1] == "(" &&
          calculatingTable[calculatingTable.length - 1] == ")") {
        setState(() {
          calculatingTable =
              calculatingTable.substring(2, calculatingTable.length - 1);
        });
      } else {
        setState(() {
          tempString += calculatingTable;
          tempString += ")";
          calculatingTable = tempString;
        });
      }
    } else {
      addElement(operator);
    }
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
}
