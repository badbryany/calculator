import 'package:flutter/material.dart';

import '../../Calculator.dart';
import '../../CalcRegularTriAngle.dart';

class CalcTriAngle extends StatefulWidget {
  @override
  _CalcTriAngleState createState() => _CalcTriAngleState();
}

class _CalcTriAngleState extends State<CalcTriAngle> {
  List<String> sites = ['a', 'b', 'c'];
  String error = '';
  dynamic siteValues = {
    'a': '',
    'b': '',
    'c': '',
  };

  void showError(String message) {
    setState(() {
      error = message;
    });
  }

  void calc() {
    print('a is missing');
    Map<String, dynamic> angles2 = RegTriAngle().sws(
      b: 4,
      c: 3,
      alpha: 90,
    );
    print(angles2);
  }

  @override
  Widget build(BuildContext context) {
    calc();
    List<Color> colors = [
      Theme.of(context).buttonColor,
      Theme.of(context).accentColor,
      Color(0xffbdc92e),
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: CustomPaint(
              painter: TriAngle(colors),
            ),
          ),
          Container(
            child: Column(
              children: [
                Text('foo'),
                Text('foo'),
                Text('foo'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TriAngle extends CustomPainter {
  final List<Color> colors;
  TriAngle(this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.strokeWidth = 4;

    // hypotenuse
    paint.color = colors[0];
    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.9),
      Offset(size.width * 0.9, size.height * 0.9),
      paint,
    );

    // second line
    paint.color = colors[1];
    canvas.drawLine(
      Offset(size.width * 0.9, size.height * 0.9),
      Offset(size.width * 0.7, size.height * 0.5),
      paint,
    );

    // ka?
    paint.color = colors[2];
    canvas.drawLine(
      Offset(size.width * 0.7, size.height * 0.5),
      Offset(size.width * 0.1, size.height * 0.9),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
