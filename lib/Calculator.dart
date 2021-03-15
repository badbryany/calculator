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
}
