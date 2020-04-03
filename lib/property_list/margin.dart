import 'package:flutter/material.dart';

class MarginProperty extends StatelessWidget {
  const MarginProperty({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: Container(
          color: Colors.green,
//          margin: EdgeInsets.all(50),

//        margin: EdgeInsets.symmetric(
//          vertical: 100,// 竖直方向约束
//          horizontal: 20,// 水平方向约束
//        ),

//          margin: EdgeInsets.fromLTRB(20.0, 30.0, 40.0, 50.0)

          margin: EdgeInsets.only(
            //用于设置哪些是非零的，不设置默认是零。
            left: 20.0,
            bottom: 40.0,
            top: 50.0,
          )),
    );
  }
}
