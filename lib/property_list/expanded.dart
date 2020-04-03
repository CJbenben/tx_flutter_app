import 'package:flutter/material.dart';

// 按照比例布局
class ExpandedProperty extends StatelessWidget {
  const ExpandedProperty({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.red,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _getRowChildren(),
            ),
          ),
          new Expanded(
            child: new Image.asset(
              'images/4.png',
            ),
          )
        ],
      ),
    );
  }

  _getRowChildren() {
    return [
      new Expanded(
        child: new Image.asset(
          "images/5.png",
        ),
      ),
      new Expanded(
        child: new Image.asset(
          "images/2.png",
          fit: BoxFit.cover,
        ),
      )
    ];
  }
}
