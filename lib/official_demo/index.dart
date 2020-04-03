import 'package:flutter/material.dart';
import 'package:txflutterapp/common/demo_tabs.dart';
import 'favorite.dart';

const List<DemoTabViewModel> demos = [
  DemoTabViewModel(
    title: '点击收藏',
    widget: FavoriteDemo(),
  ),
];

class OfficialDemo extends StatefulWidget {
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
      title: '官方收藏 demo',
      demos: demos,
      tabController: this.tabController,
    );
  }
}