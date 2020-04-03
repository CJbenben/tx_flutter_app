import 'package:flutter/material.dart';

class BasicCommon extends StatelessWidget {
  const BasicCommon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585643086002&di=e495a8b3cf23ce4f58ec4328e97b7bf1&imgtype=0&src=http%3A%2F%2Fa4.att.hudong.com%2F21%2F09%2F01200000026352136359091694357.jpg'
        ),
      ],
    );
  }
}
