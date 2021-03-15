import 'package:flutter/material.dart';

import './Calculator.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onTap;
  final Function onLongPress;
  final double? widthFactor;
  final double? heightFactor;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;

  Button({
    required this.text,
    required this.onTap,
    required this.onLongPress,
    this.widthFactor,
    this.heightFactor,
    this.bgColor,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => this.onTap(),
        onLongPress: () => this.onLongPress(),
        child: Container(
          width: 70 * ((widthFactor == null ? 1.0 : widthFactor) as double),
          height: 70 * ((heightFactor == null ? 1.0 : heightFactor) as double),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgColor == null ? Theme.of(context).cardColor : this.bgColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: this.textColor,
              fontSize: this.fontSize == null ? 23 : this.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final String data;
  final Function addValue;

  SmallButton(this.data, this.addValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Button(
        onTap: () => addValue(this.data),
        onLongPress: () {},
        heightFactor: 0.7,
        fontSize: 17,
        text: data,
      ),
    );
  }
}

class NormalButton extends StatelessWidget {
  final String data;
  final Function addValue;

  NormalButton(this.data, this.addValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Button(
        onTap: () => addValue(data),
        onLongPress: () {},
        text: data,
      ),
    );
  }
}

class LargeButton extends StatelessWidget {
  final String data;
  final Function addValue;

  LargeButton(this.data, this.addValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Button(
        onTap: () => addValue(data),
        onLongPress: () {},
        widthFactor: 2.3,
        text: data,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final Widget child;
  final Function setOperator;
  final String operator;

  ActionButton(this.child, this.setOperator, this.operator);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => setOperator(this.operator),
        child: Container(
          width: 70,
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: InkWell(
            child: child,
          ),
        ),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  final String data;
  final Function removeValue;

  ClearButton(this.data, this.removeValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Button(
        onTap: () => removeValue(false),
        onLongPress: () => removeValue(true),
        bgColor: Theme.of(context).dividerColor,
        textColor: Colors.red,
        text: data,
      ),
    );
  }
}

class SolveButton extends StatelessWidget {
  final String text;
  final Map<String, dynamic> data;
  final Function showResult;

  SolveButton(this.text, this.data, this.showResult);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Button(
        onTap: () {
          String res = Calculator()
              .calculate(
                value: data['value'],
                subValue: data['subValue'],
                operator: data['operator'],
              )
              .toString();
          showResult(res);
        },
        onLongPress: () {},
        text: text,
        bgColor: Theme.of(context).accentColor,
      ),
    );
  }
}
