import 'package:flutter/material.dart';
import 'package:txflutterapp/common/demo_tabs.dart';
import 'listview_normal.dart';
import 'listview_build.dart';
import 'listview_separated.dart';
import 'listview_pulldown.dart';
import 'listview_pullUpLoad.dart';

const List<DemoTabViewModel> demos = [
  DemoTabViewModel(
    title: '普通用法',
    widget: ListNormal(),
  ),
  DemoTabViewModel(
    title: 'build用法',
    widget: ListBuild(),
  ),
  DemoTabViewModel(
    title: 'separated用法',
    widget: ListSeparated(),
  ),
  DemoTabViewModel(
    title: '下拉刷新',
    widget: ListPullDownRefresh(),
  ),
  DemoTabViewModel(
    title: '上拉加载',
    widget: ListPullUpLoad(),
  ),
];

class ListViewDemo extends StatefulWidget {
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
      title: 'ListView组件',
      demos: demos,
      tabController: this.tabController,
    );
  }
}