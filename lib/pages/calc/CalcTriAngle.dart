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
  dynamic values = {
    'a': '',
    'b': '',
    'c': '',
    'alpha': '',
    'betha': '',
    'gamma': '',
  };
  List<dynamic> _inputs = [
    {'text': 'Seite a', 'value': 'a'},
    {'text': 'Seite b', 'value': 'b'},
    {'text': 'Seite c', 'value': 'c'},
    {'text': 'Winkel α', 'value': 'alpha'},
    {'text': 'Winkel β', 'value': 'betha'},
    {'text': 'Winkel γ', 'value': 'gamma'},
  ];

  void showError(String message) {
    setState(() {
      error = message;
    });
  }

  void calc() {
    Map<String, dynamic> triAngle = RegTriAngle().getTriAngle(
      a: double.tryParse(values['a']),
      b: double.tryParse(values['b']),
      c: double.tryParse(values['c']),
      alpha: double.tryParse(values['alpha']),
      betha: double.tryParse(values['betha']),
      gamma: double.tryParse(values['gamma']),
    );
    print(triAngle);
    if (triAngle['a'] != null &&
        triAngle['b'] != null &&
        triAngle['c'] != null &&
        triAngle['alpha'] != null &&
        triAngle['betha'] != null &&
        triAngle['gamma'] != null) {
      print(triAngle);
      setState(() {
        values['a'] = triAngle['a'].toString();
        values['b'] = triAngle['b'].toString();
        values['c'] = triAngle['c'].toString();
        values['alpha'] = triAngle['alpha'].toString();
        values['betha'] = triAngle['betha'].toString();
        values['gamma'] = triAngle['gamma'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    calc();
    List<Color> colors = [
      Theme.of(context).buttonColor.withOpacity(0.2),
      Theme.of(context).accentColor.withOpacity(0.2),
      Color(0xffbdc92e).withOpacity(0.2),
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
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                ..._inputs.map(
                  (e) => InkWell(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          String value = '';
                          return AlertDialog(
                            title: Center(child: Text(e['text'])),
                            content: TextFormField(
                              keyboardType: TextInputType.number,
                              initialValue: values[e['value']] == null
                                  ? ''
                                  : values[e['value']].toString(),
                              onChanged: (change) => value = change,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    values[e['value'].toString()] = value;
                                  });
                                  print(values);
                                  Navigator.pop(context);
                                },
                                child: Text('ok'),
                              ),
                            ],
                          );
                        }),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: 120,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).accentColor.withOpacity(0.2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              e['text'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.edit,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                ..._inputs.map(
                  (e) => Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).accentColor.withOpacity(0.2),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        double.tryParse(values[e['value']]) == null
                            ? '?'
                            : values[e['value']].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 50,
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  values = {
                    'a': '',
                    'b': '',
                    'c': '',
                    'alpha': '',
                    'betha': '',
                    'gamma': '',
                  };
                });
                /*Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).backgroundColor,
                    content: Container(
                      height: 150,
                      child: Center(
                        child: Text(
                          'alle Werte gelöscht',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                );*/
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 50,
            child: IconButton(
              icon: Icon(Icons.info),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  child: Text('rechenweg'),
                ),
              ),
            ),
          ),
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
