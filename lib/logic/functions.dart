import 'dart:developer';

import "package:flutter/material.dart";
import 'package:math_expressions/math_expressions.dart';
import '../home.dart';

abstract class DefaultFunctions extends State<MyCalculatorHomePage> {
  late String calculatingTable;
  final String symbols = "+-*/^";
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
      calculatingTable.endsWith("^(1/2)")
          ? (calculatingTable =
              calculatingTable.substring(0, calculatingTable.length - 6))
          : (calculatingTable != ""
              ? calculatingTable =
                  calculatingTable.substring(0, calculatingTable.length - 1)
              : true);
    });
  }

  void evaluateCircumstances(String operator) {
    if ((calculatingTable.isEmpty || symbols.contains(calculatingTable[0])) &&
        ((calculatingTable.isEmpty &&
            (operator == "+" || operator == "*" || operator == "/")))) {
      true;
    } else if (calculatingTable.isEmpty) {
      addElement(operator);
    } else if (calculatingTable[0] == "-") {
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

// void evaluateCircumstances(String operator) {
//     if ((calculatingTable.isEmpty || symbols.contains(calculatingTable[0])) &&
//         ((calculatingTable.isEmpty &&
//             (operator == "+" || operator == "*" || operator == "/")))) {
//       true;
//     } else if (calculatingTable.isEmpty) {
//       addElement(operator);
//     } else if (calculatingTable[0] == "-" &&
//         calculatingTable.length > 1 &&
//         symbols.contains(operator)) {
//       if (symbols.contains(calculatingTable[calculatingTable.length - 1])) {
//         replaceElement(operator);
//       } else {
//         addElement(operator);
//       }
//     } else {
//       addElement(operator);
//     }
//     print(calculatingTable);
//   }