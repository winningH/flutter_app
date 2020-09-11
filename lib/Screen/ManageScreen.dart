import 'package:flutter/material.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('管理'), 
      ),
      body: Center(
        child: new Text('管理'), 
      ),
    );
  }
}