import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:txflutterapp/tabbar/ContanctsScreen.dart';
import 'package:txflutterapp/tabbar/manager/ManagerScreen.dart';
import 'package:txflutterapp/tabbar/My.dart';
import 'package:txflutterapp/tabbar/TXHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //RN  render
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstScreen(),
    );
  }
}

// 暗号：初见 flutter
class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);
  @override
  _FirstScreenState createState() => _FirstScreenState();
}
class _FirstScreenState extends State<FirstScreen> {

  final List<Widget> _children = [
    TXHome(),
    ContanctsScreen(),
    ManagerScreen(),
    My(),
  ];
  int _currentIndex = 0;
  void onTabTapped(int selectIndex) {
    setState(() {
      _currentIndex = selectIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      drawer: new Drawer(
         child: Center(
          child: Text('Drawer'), 
         ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,//Color(0xff123456),
        unselectedItemColor: Colors.lightGreen,
        // selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: Icon(Icons.free_breakfast),
            title: Text('首页')
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('发现')
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.web_asset),
            title: Text('管理')
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text('我的')
          ),

        ]
      ),
    );
  }
}