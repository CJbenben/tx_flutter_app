import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'navigation/navi_jump_second.dart';
import 'official_demo/index.dart';
import 'property_list/index.dart';
import 'basic_widgets/index.dart';
import 'list_view/index.dart';
import 'grid_view/index.dart';
import 'navigation/index.dart';
import 'hook_binding/index.dart';
import 'gesture/index.dart';
import 'animate/index.dart';
import 'async_Isolate/index.dart';
import 'webview_flutter/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new HomePage(),
      routes: {
        'official_demo': (context) => OfficialDemo(),
        'property_list': (context) => PropertyListDemo(),
        'basic_widgets': (context) => BasicWidgetsDemo(),
        'list_view': (context) => ListViewDemo(),
        'grid_view': (context) => GridViewDemo(),
        'navigation': (context) => NavigationDemo(),
        'next_view': (context) => NaviNextAction(),
        'hook_binding': (context) => HookBindingDemo(),
        'gesture': (context) => GestureRecognizerDemo(),
        'animate': (context) => AnimateDemo(),
        'async': (context) => Async_IsolateDemo(),
        'webview': (context) => WebViewDemo(),
      },
    );
  }
}

const dataAry = <TXDataModel>[
  TXDataModel(
    title: '官方收藏demo',
    fouteName: 'official_demo',
  ),
  TXDataModel(
    title: '属性列表',
    fouteName: 'property_list',
  ),
  TXDataModel(
    title: '基础组件',
    fouteName: 'basic_widgets',
  ),
  TXDataModel(
    title: 'ListView组件',
    fouteName: 'list_view',
  ),
  TXDataModel(
    title: 'GridView组件',
    fouteName: 'grid_view',
  ),
  TXDataModel(
    title: 'Navigation 组件',
    fouteName: 'navigation',
  ),
  TXDataModel(
    title: '监听生命周期',
    fouteName: 'hook_binding',
  ),
  TXDataModel(
    title: '手势&触摸事件',
    fouteName: 'gesture',
  ),
  TXDataModel(
    title: '动画',
    fouteName: 'animate',
  ),
//  TXDataModel(
//    title: 'webView交互',
//    fouteName: 'webview',
//  ),
  TXDataModel(
    title: '线程&异步',
    fouteName: 'async',
  ),
];

class TXDataModel {
  final String title;
  final String fouteName;
  const TXDataModel({
    this.title,
    this.fouteName,
  });
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Demo'),
      ),
      body: GridView.builder(
          itemCount: dataAry.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return FlatButton(
                onPressed: () =>
                    Navigator.pushNamed(context, dataAry[index].fouteName),
                color: getRandomColor(),
                child: new Column(
                  children: <Widget>[
                    new Expanded(
                        child: Center(
                      child: Text(
                        dataAry[index].title,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ))
                  ],
                ));
          }),
    );
  }

  getRandomColor() {
    return Color.fromARGB(255, Random.secure().nextInt(255),
        Random.secure().nextInt(255), Random.secure().nextInt(255));
  }
}
