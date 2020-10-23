import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;
//  WebViewController _webViewController; // 添加一个controller

  const WebViewPage({
    Key key,
    this.title,
    this.url,
  }) : super(key: key);

//  const WebViewPage({Key key}) : super(key: key);
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

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
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      javascriptChannels: <JavascriptChannel>[

      ].toSet(),
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          print('blocking navigation to $request}');
          return NavigationDecision.prevent;
        }
        print('allowing navigation to $request');
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
      },
    );
  }
}
