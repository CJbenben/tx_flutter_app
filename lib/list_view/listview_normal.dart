import 'package:flutter/material.dart';

class ListNormal extends StatelessWidget {
  const ListNormal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        new Center(
          child: new Text(
            '这里是普通 listview ',
          ),
        ),
        new Image.asset(
          'images/5.png',
        ),
        new Text(
            '这里是普通 listview2 '
        ),
        new Image.asset(
          'images/4.png',
        )
      ],
    );
  }

}
