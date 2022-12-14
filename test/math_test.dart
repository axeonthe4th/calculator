import 'package:flutter_test/flutter_test.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/main.dart';

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
}
