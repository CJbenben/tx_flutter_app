import 'package:flutter/material.dart';

class OtherAppPage extends StatelessWidget {
  const OtherAppPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      child: new Text(
          '在 iOS 中，要跳转到其他 App，你需要一个特定的 URL Scheme。对系统级别的 App 来说，这个 scheme 取决于 App。为了在 Flutter 中实现这个功能，你可以创建一个原生平台的整合层，或者使用现有的 plugin，例如 url_launcher。'),
    );
  }
}
