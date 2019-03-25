import 'package:flutter/material.dart';
import 'package:inter_screen_animation/Views/page_switcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cross screens animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        decoration: new BoxDecoration(color: Color.fromRGBO(205, 205, 205, 1)),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: PageSwitcher(),
        ),
      ),
    );
  }
}
