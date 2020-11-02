import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class RequestListViewAction extends StatefulWidget {
  const RequestListViewAction({Key key}) : super(key: key);
  _HttpActionState createState() => _HttpActionState();
}

class _HttpActionState extends State<RequestListViewAction> {
  List dataAry = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    return dataAry.length == 0;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  ListView getListView() => ListView.separated(
        itemCount: dataAry.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              this.topview(index),
              this.mainview(index),
            ],
          );
        },
      );

  Widget topview(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Icon(Icons.shop),
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    '${dataAry[index]['category']}',
                  ),
                  new Text(
                    '${dataAry[index]['author_name']}',
                  ),
                ],
              ),
            ],
          ),
          new Text('${dataAry[index]['date']}'),
        ],
      ),
    );
  }

  Widget mainview(int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            color: Colors.black12,
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
          ),
          Text(
            '${dataAry[index]['title']}',
          ),
          new Image.network(
            '${dataAry[index]['thumbnail_pic_s']}',
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  loadData() async {
    var result;
    String requestUrl =
        'http://m.app.haosou.com/index/getData?type=1&page=1';
    http.Response response = await http.get(requestUrl);
    if (response.statusCode == HttpStatus.ok) {
      var json = response.body;
      var dataDict = jsonDecode(json);
      result = dataDict['result'];
      var data = result['data'];
      if (data != null) {
        setState(() {
          dataAry = data;
        });
      }
      debugPrint(data.toString());
    } else {
      debugPrint('code = ' +
          response.statusCode.toString() +
          '-->' +
          response.request.toString());
      Toast.show('服务器繁忙，请稍后重试', context);
    }
  }
}
