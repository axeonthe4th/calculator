import 'package:flutter_test/flutter_test.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/main.dart';
import "dart:collection";

void main() {
  setUp(() {});

  test("math", () {
    Parser p = Parser();
    Expression exp = p.parse("x*1 - (-5)");

    print(exp); // = ((x * 1.0) - -(5.0))
    print(exp.simplify()); // = (x + 5.0)

    Expression expDerived = exp.derive('x');

    print(expDerived); // = (((x * 0.0) + (1.0 * 1.0)) - -(0.0))
    print(expDerived.simplify()); // = 1.0
  });

  test("calc", () {
// Function to convert infix to prefix
    String infixToPrefix(String exp) {
      // Stack for operands
      List<String> operandStack = [];

      // Traverse the expression
      for (int i = exp.length - 1; i >= 0; i--) {
        // If the character is an operand, push it to the operand stack
        if (exp[i] != '+' &&
            exp[i] != '-' &&
            exp[i] != '' &&
            exp[i] != '/' &&
            exp[i] != '(' &&
            exp[i] != ')') {
          operandStack.add(exp[i]);
        }
        // If the character is an operator
        else {
          // Pop the operands from the operand stack and append them to the operator
          String operand1 = operandStack.removeLast();
          String operand2 = operandStack.removeLast();
          String operator = exp[i];
          String result = operator + operand2 + operand1;

          // Push the result to the operand stack
          operandStack.add(result);
        }
      }

      // Return the result from the operand stack
      return operandStack.removeLast();
    }

    void main() {
      String exp = "A+BC";
      print(infixToPrefix(exp)); // Output: "*+ABC"
    }
  });
}
