import 'package:flutter/material.dart';
// import 'package:flutter_app/home.dart';
import 'package:flutter_app/mine/SecondScreen.dart';
import 'package:flutter_app/mine/ThirdScreen.dart';
import 'package:flutter_app/WelcomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),
      routes: {
        '/second': (BuildContext context) {
          return SecondScreen(content: 'second screen');
        },
        '/third': (BuildContext context) {
          return ThirdScreen();
        }
      }
    );
  }
}
