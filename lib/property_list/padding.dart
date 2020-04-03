import 'package:flutter/material.dart';

class PaddingProperty extends StatelessWidget {
  const PaddingProperty({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
          padding: EdgeInsets.all(10), //设置内部Text控件边距
          color: Colors.yellow,
          // 这个是约束
//          constraints: BoxConstraints.expand(),
          constraints: BoxConstraints(
//            maxHeight: 300,
//            maxWidth: 200,
            minWidth: 150,
            minHeight: 10,
          ),
          child: Text(
            '这里是笨笨编程，这里的长度是根据文字自适应的。好像还不够长啊。',
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
