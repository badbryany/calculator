import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './pages/CalcPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color darkBGColor = Color(0xff17181a);
  final Color lightBGColor = Color(0xfff6f8f9);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      title: 'calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        accentColor: Color(0xff2ec973),
        cardColor: Color(0xffe9f0f4),
        backgroundColor: lightBGColor,
        scaffoldBackgroundColor: lightBGColor,
        buttonColor: Color(0xffff9500),
        dividerColor: Color(0xfff8eced),
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
          subtitle1: TextStyle(
            color: Color(0xff9b9ea2),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          subtitle2: TextStyle(
            color: Color(0xfff9c983),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      darkTheme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
          subtitle1: TextStyle(
            color: Color(0xff646566),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          subtitle2: TextStyle(
            color: Color(0xff81510d),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        fontFamily: 'Poppins',
        iconTheme: IconThemeData(color: Colors.white),
        accentColor: Color(0xff2ec973),
        cardColor: Color(0xff222427),
        backgroundColor: darkBGColor,
        scaffoldBackgroundColor: darkBGColor,
        buttonColor: Color(0xffff9500),
        dividerColor: Color(0xff2d191e),
        brightness: Brightness.dark,
      ),
      home: CalcPage(),
    );
  }
}
