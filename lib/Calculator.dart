import 'dart:math';
import 'dart:core';

class Calculator {
  final Function showError;

  Calculator(this.showError);

  double calculate({
    required String operator,
    required String value,
    required String subValue,
  }) {
    showError('');
    double? calcValue = double.tryParse(value);
    double? calcSubValue = double.tryParse(subValue);

    double result;

    // CHECK FOR CONSTANTS
    calcValue = parseConstant(value);
    calcSubValue = parseConstant(subValue);

    switch (operator) {
      case '/':
        result = calcSubValue / calcValue;
        break;
      case '+':
        result = calcSubValue + calcValue;
        break;
      case '-':
        result = calcSubValue - calcValue;
        break;
      case '*':
        result = calcSubValue * calcValue;
        break;
      default:
        print('no operator');
        result = calcValue;
        break;
    }
    return result;
  }

  double parseConstant(String value) {
    double? returnValue = double.tryParse(value);
    if (returnValue == null) {
      returnValue = 500;
      showError('Math error');
    }

    if (value == 'π') {
      returnValue = pi;
    }
    if (value == 'e') {
      returnValue = e;
    }

    if (value.contains('π') && value != 'π' && value != 'e') {
      List<String> split = value.split('π');
      returnValue = double.parse(split[0]) * pi;
    }
    if (value.contains('e') && returnValue != pi && returnValue != e) {
      List<String> split = value.split('e');
      returnValue = double.parse(split[0]) * e;
    }

    return returnValue;
  }

  double square({required double num, int? times}) {
    double result = num;
    if (times == null) {
      times = 2;
    }
    for (int i = 0; i < times - 1; i++) {
      result = result * num;
    }
    return result;
  }

  double pythagoras(dynamic sites) {
    var a = sites['a'];
    var b = sites['b'];
    var c = sites['c'];
    // CHECK IF IT IS SOLVEABLE
    if (a == '' && b == '' || a == '' && c == '' || b == '' && c == '') {
      return 0;
    }

    if (a == '') {
      return sqrt(square(num: double.parse(c)) - square(num: double.parse(b)));
    }
    if (b == '') {
      return sqrt(square(num: double.parse(c)) - square(num: double.parse(a)));
    }
    if (c == '') {
      return sqrt(square(num: double.parse(a)) + square(num: double.parse(b)));
    }
    return 0;
  }

  bool checkPythagoras(dynamic sites) {
    double a = double.parse(sites['a']);
    double b = double.parse(sites['b']);
    double c = double.parse(sites['c']);

    double checkC = square(num: a) + square(num: b);

    if (c == checkC) {
      return true;
    }
    return false;
  }
}
