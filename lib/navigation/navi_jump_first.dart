import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'navi_jump_third.dart';

class NaviJumpAction extends StatelessWidget {
  const NaviJumpAction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 第一行按钮
    _firstRow() {
      return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MaterialButton(
            color: Colors.blue,
            minWidth: 170,
            height: 45,
            child: Text(
              'push next vc',
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'next_view');
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 6),
          ),
          MaterialButton(
            color: Colors.blue,
            minWidth: 170,
            height: 45,
            child: Text(
              'push next vc with return',
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'next_view').then((value) {
                Toast.show(value.toString(), context);
              });
            },
          ),
        ],
      );
    }

    // 第二行按钮
    _secondRow() {
      return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MaterialButton(
            color: Colors.blue,
            minWidth: 170,
            height: 45,
            child: Text(
              'push next vc with param',
            ),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) {
                  return new ThirdPage(
                    title: 'please input phone',
                    phone: '18912341234',
                  );
                }),
              ).then((result) {
                Toast.show(result.toString(), context);
              });
            },
          ),
//          Padding(
//            padding: EdgeInsets.only(left: 6),
//          ),
//          MaterialButton(
//            color: Colors.blue,
//            minWidth: 170,
//            height: 45,
//            child: Text(
//              'push next vc with return',
//            ),
//            onPressed: () {
//              Navigator.pushNamed(context, 'next_view').then((value) {
//                Toast.show(value.toString(), context);
//              });
//            },
//          ),
        ],
      );
    }

    return new Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: new Column(
        children: <Widget>[
          _firstRow(),
          Padding(padding: EdgeInsets.only(top: 20)),
          _secondRow(),
        ],
      ),
    );
  }
}
