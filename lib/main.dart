import 'package:flutter/material.dart';
import 'package:flutter_app/Screen/DiscoverScreen.dart';
import 'package:flutter_app/Screen/FriendsScreen.dart';
import 'package:flutter_app/Screen/ManageScreen.dart';
import 'package:flutter_app/Screen/MineScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter App',
      theme: new ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: SecondScreen(),
    );  
  }
}

class SecondScreen extends StatefulWidget {
  //构造函数
  SecondScreen();

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  //定义界面容器
  final List<Widget> _children = [
    FriendsScreen(),
    DiscoverScreen(),
    ManageScreen(),
    MineScreen()
  ];
  int _currentIndex = 0;

  void onTabTapped(int selectIndex) {
    setState(() {
      _currentIndex = selectIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('好友')
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            title: new Text('发现')
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: new Text('管理')
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: new Text('我的')
          )
        ],
      ),
    );
  }
}
