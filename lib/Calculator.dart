class Calculator {
  double calculate({
    required String operator,
    required String value,
    required String subValue,
  }) {
    double result = 500;
    switch (operator) {
      case '/':
        result = double.parse(subValue) / double.parse(value);
        break;
      case '+':
        result = double.parse(subValue) + double.parse(value);
        break;
      case '-':
        result = double.parse(subValue) - double.parse(value);
        break;
      case '*':
        result = double.parse(subValue) * double.parse(value);
        break;
    }
    return result;
  }
}
