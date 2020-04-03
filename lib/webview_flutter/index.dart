import 'package:flutter/material.dart';
import 'package:txflutterapp/common/demo_tabs.dart';
import 'webview.dart';
/*
 * 参考文献：
 */

const List<DemoTabViewModel> demos = [
  DemoTabViewModel(
    title: 'webview',
    widget: WebViewPage(),
  ),
];

class WebViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tabController = TabController(length: demos.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DemoTabs(
      title: '基础组件',
      demos: demos,
      tabController: this.tabController,
    );
  }
}