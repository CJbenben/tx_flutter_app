import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
//  String url;
//  final String title;
//  WebViewController _webViewController; // 添加一个controller
//
//  WebViewPage({this.url, this.title});

  const WebViewPage({Key key}) : super(key: key);
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
  }

  JavascriptChannel _JsBridge(BuildContext context) => JavascriptChannel(
      name: 'lkMsg', // 与h5 端的一致 不然收不到消息
      onMessageReceived: (JavascriptMessage message) async {
        print(message.message);
      });
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text('data');
  }
}
