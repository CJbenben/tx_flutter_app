import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpAction extends StatefulWidget {
  const HttpAction({Key key}) : super(key: key);
  _HttpActionState createState() => _HttpActionState();
}

class _HttpActionState extends State<HttpAction> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      children: <Widget>[
        new MaterialButton(
          color: Colors.yellow,
          child: new Text('getHttp1'),
          onPressed: _getHttp,
        ),
        new MaterialButton(
          color: Colors.yellow,
          child: new Text('getHttp2'),
          onPressed: _getHttp2,
        ),
      ],
    );
  }

  _getHttp() async {
    String requestUrl =
        'http://v.juhe.cn/toutiao/index?key=ad2908cae6020addf38ffdb5e2255c06';
    var httpClient = new HttpClient();
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(requestUrl));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['reason'];
        print(data.toString());
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    Toast.show(result.toString(), context);
  }

  _getHttp2() async {
    String result;
    String requestUrl =
        'http://v.juhe.cn/toutiao/index1?key=ad2908cae6020addf38ffdb5e2255c06';
    http.Response response = await http.get(requestUrl);
    if (response.statusCode == HttpStatus.ok) {
      var json = response.body;
      var data = jsonDecode(json);
      result = data['reason'];
      Toast.show(result.toString(), context);
    } else {
      debugPrint('code = ' + response.statusCode.toString() + '-->' + response.request.toString());
      Toast.show('服务器繁忙，请稍后重试', context);
    }
  }
}
