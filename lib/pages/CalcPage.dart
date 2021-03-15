import 'package:flutter/material.dart';

import '../Widgets.dart';
import './calc/SdPythagoras.dart';
import './ExtraCalcPage.dart';

class CalcPage extends StatefulWidget {
  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  List<dynamic> _row1 = [
    {'text': 'e', 'type': 'small'},
    {'text': 'π', 'type': 'small'},
    {'text': 'sin', 'type': 'small'},
    {'text': 'deg', 'type': 'small'},
  ];

  List<dynamic> _row2 = [
    {'text': 'C', 'type': 'clear'},
    {'text': '(', 'type': 'normal'},
    {'text': ')', 'type': 'normal'},
    {
      'text': Text('/',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
      'type': 'button',
      'operator': '/'
    },
  ];

  List<dynamic> _row3 = [
    {'text': '7', 'type': 'normal'},
    {'text': '8', 'type': 'normal'},
    {'text': '9', 'type': 'normal'},
    {'text': Icon(Icons.clear), 'type': 'button', 'operator': '*'},
  ];

  List<dynamic> _row4 = [
    {'text': '4', 'type': 'normal'},
    {'text': '5', 'type': 'normal'},
    {'text': '6', 'type': 'normal'},
    {'text': Icon(Icons.remove), 'type': 'button', 'operator': '-'},
  ];

  List<dynamic> _row5 = [
    {'text': '1', 'type': 'normal'},
    {'text': '2', 'type': 'normal'},
    {'text': '3', 'type': 'normal'},
    {'text': Icon(Icons.add), 'type': 'button', 'operator': '+'},
  ];

  List<dynamic> _row6 = [
    {'text': '0', 'type': 'large'},
    {'text': '.', 'type': 'normal'},
    {'text': '=', 'type': 'solve'},
  ];

  List<dynamic> popUpItems = [
    {'text': 'Satz des Pythagoras', 'link': SdPythagoras()},
  ];

  String value = '';
  String subValue = '';
  String operator = '';

  String error = '';

  Widget whichButton(dynamic e) {
    switch (e['type']) {
      case 'small':
        return SmallButton(e['text'], addValue);

      case 'normal':
        return NormalButton(e['text'], addValue);

      case 'button':
        return ActionButton(e['text'], setOperator, e['operator']);

      case 'large':
        return LargeButton(e['text'], addValue);

      case 'solve':
        return SolveButton(
          e['text'],
          {
            'value': value,
            'subValue': subValue,
            'operator': operator,
          },
          showResult,
          showError,
        );

      case 'clear':
        return ClearButton(e['text'], removeValue);

      default:
        return Text('foo');
    }
  }

  void addValue(String num) {
    showError('');
    setState(() {
      value += num;
    });
  }

  void removeValue(bool all) {
    showError('');
    if (all) {
      setState(() {
        value = '';
        subValue = '';
        operator = '';
      });
      return;
    }
    String result = value.substring(0, value.length - 1);
    setState(() {
      value = result;
    });
  }

  void setOperator(String _operator) {
    showError('');
    operator = _operator;
    setState(() {
      subValue = value;
      value = '';
    });
  }

  void showResult(result) {
    showError('');
    setState(() {
      subValue = '';
      operator = '';
      value = result.toString();
    });
  }

  void showError(String errorMessage) {
    setState(() {
      error = errorMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              // MENU
              Positioned(
                top: 10,
                left: 10,
                child: PopupMenuButton(
                  child: Icon(Icons.more_vert),
                  onSelected: (value) {
                    if (value.runtimeType == SdPythagoras) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExtraCalcPage(
                              'Satz des Phytagoras', SdPythagoras()),
                        ),
                      );
                    } else {
                      print('nö');
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    ...popUpItems.map(
                      (e) => PopupMenuItem(
                        child: Text(
                          'Satz des Pythagoras',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        value: SdPythagoras(),
                      ),
                    ),
                  ],
                ),
              ),
              // EQUATION
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  right: 35,
                  left: 35,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          subValue + ' ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          operator,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 20),
                    Text(error, style: Theme.of(context).textTheme.caption)
                  ],
                ),
              ),

              // BUTTONS
              Positioned(
                bottom: 0,
                right: 10,
                left: 10,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ..._row1.map((e) => whichButton(e)),
                      ],
                    ),
                    Row(
                      children: [
                        ..._row2.map((e) => whichButton(e)),
                      ],
                    ),
                    Row(
                      children: [
                        ..._row3.map((e) => whichButton(e)),
                      ],
                    ),
                    Row(
                      children: [
                        ..._row4.map((e) => whichButton(e)),
                      ],
                    ),
                    Row(
                      children: [
                        ..._row5.map((e) => whichButton(e)),
                      ],
                    ),
                    Row(
                      children: [
                        ..._row6.map((e) => whichButton(e)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
