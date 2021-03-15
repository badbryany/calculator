import 'package:flutter/material.dart';

class ExtraCalcPage extends StatelessWidget {
  final String title;
  final Widget content;

  ExtraCalcPage(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 5,
                left: 5,
                right: 5,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      this.title,
                      style: Theme.of(context).textTheme.overline,
                    ),
                  ],
                ),
              ),
              Center(
                child: this.content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
