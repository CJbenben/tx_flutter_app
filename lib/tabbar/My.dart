import 'package:flutter/material.dart';

class My extends StatelessWidget {
  const My({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: new Center(
        child: Text(
          '我的',
          style: new TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ), 
      ),
    );
  }
}