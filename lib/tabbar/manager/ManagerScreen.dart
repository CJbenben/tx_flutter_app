import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'ArticleItem.dart';
import 'Article.dart';

class ManagerScreen extends StatefulWidget {
  ManagerScreen({Key key}) : super(key: key);
  @override
  _ManagerScreenState createState() => _ManagerScreenState();

}

class _ManagerScreenState extends State<ManagerScreen> {
  List dataAry = [];
  bool isLoading = false;
  int currPage = 1;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.scrollController.addListener(() {
      if (!this.isLoading &&
          this.scrollController.position.pixels >=
              this.scrollController.position.maxScrollExtent) {
          this.isLoading = true;
          this.currPage++;
          loadMoreData(this.currPage);
      }
    });
    loadData();
  }

  showLoadingDialog() {
    return dataAry.length == 0;
  }

  Future onRefresh() {
    return Future.delayed(
      Duration(seconds: 1),
          () {
        //Toast.show('已经是最新数据了', context);
            loadData();
      },
    );
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return RefreshIndicator(
        onRefresh: this.onRefresh,
        child: getListView()
      );
    }
  }

  getProgressDialog() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget renderBottom() {
    if (this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: new Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      );
    }
  }

  ListView getListView() => ListView.separated(
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 4,
    ),
    controller: this.scrollController,
    itemCount: this.dataAry.length,
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemBuilder: (context, index) {
      var model = this.dataAry[index];
      debugPrint("index = " + index.toString());
      if (index < this.dataAry.length) {
        return ArticleItem(model);
      } else {
        return this.renderBottom();
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  loadData() async {
    List result;
    String requestUrl =
        'http://m.app.haosou.com/index/getData?type=1&page=1';
    http.Response response = await http.get(requestUrl);
    if (response.statusCode == HttpStatus.ok) {
      var json = response.body;
      var dataDict = jsonDecode(json);
      result = dataDict['list'];
      if (result != null) {
        result.forEach((v) {
          var model = Article.fromJson(v);
          dataAry.add(model);
        });
        setState(() {
          dataAry = dataAry;
        });
      }
      debugPrint(result.toString());
    } else {
      debugPrint('code = ' +
          response.statusCode.toString() +
          '-->' +
          response.request.toString());
      Toast.show('服务器繁忙，请稍后重试', context);
    }
  }

  loadMoreData(int currPage) async {
    List result;
    String requestUrl =
        'http://m.app.haosou.com/index/getData?type=1&page='+currPage.toString();
    http.Response response = await http.get(requestUrl);
    if (response.statusCode == HttpStatus.ok) {
      var json = response.body;
      var dataDict = jsonDecode(json);
      result = dataDict['list'];
      if (result != null) {
        result.forEach((v) {
          var model = Article.fromJson(v);
          dataAry.add(model);
        });
        setState(() {
          dataAry = dataAry;
        });
      }
      debugPrint(result.toString());
    } else {
      debugPrint('code = ' +
          response.statusCode.toString() +
          '-->' +
          response.request.toString());
      Toast.show('服务器繁忙，请稍后重试', context);
    }
  }

  void dispose() {
    super.dispose();
    this.scrollController.dispose();
  }

}