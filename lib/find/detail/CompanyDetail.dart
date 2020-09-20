import 'package:flutter/material.dart';
import 'package:flutter_app/Application.dart';
import 'package:flutter_app/find/company.dart';
import 'package:flutter_app/find/detail/DotsIndicator.dart';
import 'package:flutter_app/find/detail/CompanyHot.dart';
import 'package:flutter_app/find/detail/CompanyInc.dart';
import 'package:flutter_app/find/detail/CompanyInfo.dart';

const double _kBannerHeight = 256.0;

class CompanyDetailScreen extends StatefulWidget {
  
  final Company _company;

  CompanyDetailScreen(this._company);

  @override
  _CompanyDetailScreenState createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen> with TickerProviderStateMixin {

  List<Widget> pages = <Widget>[];
  List<String> _urls = [
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
    'https://img2.bosszhipin.com/mcs/chatphoto/20151215/a79ac724c2da2a66575dab35384d2d75532b24d64bc38c29402b4a6629fcefd6_s.jpg',
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180207/c15c2fc01c7407b98faf4002e682676b.jpg'
  ];

  List<Tab> _tabs;
  TabController _controller;
  VoidCallback onChanged;
  int _showIndex = 0;

  @override
  void initState() {
    super.initState();

    _urls.forEach((String url) { 
      pages.add(
        new Container(
          color: Colors.black,
          child: new ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: new Image.network(
              url,
              height: _kBannerHeight,
              fit: BoxFit.cover,
            ),
          ),
        )
      );
    });

    _tabs = [
      new Tab(text: '公司概况'),
      new Tab(text: '热招职位')
    ];
    _controller = new TabController(length: _tabs.length, vsync: this);
    onChanged = () {
      setState(() {
        _showIndex = _controller.index;
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size.fromHeight(_kBannerHeight),
                  child: IndicatorViewPager(pages: pages),
                ),
                new Container(
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      new CompanyInfo(widget._company),
                      new Divider(),
                      new TabBar(
                        tabs: _tabs,
                        controller: _controller,
                        labelColor: Colors.black,
                        labelStyle: new TextStyle(fontSize: 16.0),
                        indicatorWeight: 3.0,
                        // indicatorSize: TabBarIndicatorSize.label,
                        // onTap: (index) {
                        //   setState(() {
                        //     _showIndex = index;
                        //   });
                        // }
                      )
                    ],
                  ),
                ),

                IndexedStack(
                  index: _showIndex,
                  children: <Widget>[
                    CompanyInc(widget._company.inc),
                    CompanyHotJob()
                  ], 
                )
              ],
            ),
          ),

          new Positioned(
            top: Application.statusBarHeight,
            left: 10,
            child: BackButton(color: Colors.white),
          )

        ], 
      )
    );
  }
}