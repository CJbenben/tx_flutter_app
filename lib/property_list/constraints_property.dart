import 'package:flutter/material.dart';

class ConstraintsProperty extends StatelessWidget {
  const ConstraintsProperty({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        new Container(
//        color: Color(0xFFFFFFFF),
          color: Colors.green,
          //不加这句话，Container会自适应child大小;加上以后会充满屏幕
//        alignment: Alignment(-0.5, 0.5),
          alignment: Alignment(0, 0),
          child: Container(
            alignment: Alignment(0, 0),
            color: Colors.red,
            child: Text(
              '这里是子控件',
              style: TextStyle(fontSize: 18),
              textDirection: TextDirection.ltr,
            ),
            constraints: BoxConstraints(
              maxHeight: 300,
              maxWidth: 200,
              minWidth: 150,
              minHeight: 100,
            ),
//            constraints: BoxConstraints.expand(), //不去适应子控件，而是充满整个屏幕或父控件
          ),
        ),
        new Container(
          child: Text(
            '这里是另一个容器',
            style: TextStyle(fontSize: 30),
            textDirection: TextDirection.ltr,
          ),
        ),
      ],
    );
  }
}