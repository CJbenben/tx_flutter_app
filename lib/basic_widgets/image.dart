import 'package:flutter/material.dart';

class BasicImages extends StatelessWidget {
  const BasicImages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585646311166&di=5d407688305875d55ff218fc75aada26&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2019-03-23%2F5c95c7b222180.jpg'),
        new Image.asset(
          "images/2.png",
          fit: BoxFit.cover,
        ),
        new Image.asset(
          'images/1.png',
        )
      ],
    );
  }
}