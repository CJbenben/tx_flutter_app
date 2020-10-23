import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("管理"),
      ),
      body: new Center(
        child: Text(
          '管理',
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