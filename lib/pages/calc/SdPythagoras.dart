import 'package:flutter/material.dart';

import '../../Calculator.dart';

class SdPythagoras extends StatefulWidget {
  @override
  _SdPythagorasState createState() => _SdPythagorasState();
}

class _SdPythagorasState extends State<SdPythagoras> {
  List<String> sites = ['a', 'b', 'c'];
  String error = '';

  dynamic siteValues = {
    'a': '',
    'b': '',
    'c': '',
  };

  void pythagoras() {
    if (siteValues['a'] != '' &&
        siteValues['b'] != '' &&
        siteValues['c'] != '') {
      setState(() {
        error = Calculator(showError).checkPythagoras(siteValues).toString();
      });
      return;
    }

    showError(Calculator(showError).pythagoras(siteValues).toString());
  }

  void showError(String message) {
    setState(() {
      error = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    pythagoras();
    int index = -1;
    List<Color> colors = [
      Theme.of(context).buttonColor,
      Theme.of(context).accentColor,
      Color(0xffbdc92e),
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      child: Stack(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: CustomPaint(
              painter: TriAngle(colors),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 10,
            right: 10,
            child: Column(
              children: [
                ...sites.map((e) {
                  index = index + 1 % 3;
                  return InkWell(
                    onLongPress: () => setState(() {
                      siteValues[e] = '';
                    }),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Center(child: Text('Länge von Seite $e')),
                        content: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Länge',
                            hintStyle: Theme.of(context).textTheme.bodyText1,
                            labelText: 'Seite $e',
                            labelStyle: Theme.of(context).textTheme.bodyText1,
                          ),
                          onChanged: (value) => setState(() {
                            siteValues[e] = value;
                            print(siteValues[e]);
                            print(siteValues.length);
                          }),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'ok',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: colors[index], width: 2),
                      ),
                      child: Center(
                        child: Text(
                          e +
                              ' = ' +
                              (siteValues[e] == '' ? '?' : siteValues[e]),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  );
                }),
                Text(
                  error,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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

    // vertical line
    paint.color = colors[1];
    canvas.drawLine(
      Offset(size.width * 0.9, size.height * 0.9),
      Offset(size.width * 0.9, size.height * 0.5),
      paint,
    );

    // ka?
    paint.color = colors[2];
    canvas.drawLine(
      Offset(size.width * 0.9, size.height * 0.5),
      Offset(size.width * 0.1, size.height * 0.9),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
