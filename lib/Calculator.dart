import 'dart:math';
import 'dart:core';

class Calculator {
  double calculate({
    required String operator,
    required String value,
    required String subValue,
  }) {
    double? calcValue = double.tryParse(value);
    double? calcSubValue = double.tryParse(subValue);

    double result = 500;

    // CHECK FOR CONSTANTS

    if (value.contains('π')) {
      calcValue = pi;
    }
    if (subValue.contains('π')) {
      calcSubValue = pi;
    }
    if (value.contains('e')) {
      calcValue = e;
    }
    if (subValue.contains('e')) {
      calcSubValue = e;
    }

    if (calcValue == null) {
      calcValue = 0;
    }
    if (calcSubValue == null) {
      calcSubValue = 0;
    }

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
        result = calcValue;
        break;
    }
    return result;
  }
}
