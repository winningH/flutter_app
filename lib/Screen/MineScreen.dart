import 'package:flutter/material.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('我的'), 
      ),
      body: Center(
        child: new Text('我的'), 
      ),
    );
  }
}