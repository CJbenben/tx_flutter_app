import 'package:flutter/material.dart';
import 'package:txflutterapp/common/demo_tabs.dart';
import 'package:txflutterapp/navigation/navi_jump_app.dart';
import 'navi_jump_first.dart';
import 'navi_jump_app.dart';

const List<DemoTabViewModel> demos = [
  DemoTabViewModel(
    title: '页面跳转',
    widget: NaviJumpAction(),
  ),
  DemoTabViewModel(
    title: '跳转其他 APP',
    widget: OtherAppPage(),
  ),
];

class NavigationDemo extends StatefulWidget {
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
      title: 'navi_jump 组件',
      demos: demos,
      tabController: this.tabController,
    );
  }
}