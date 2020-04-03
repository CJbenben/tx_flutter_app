import 'package:flutter/material.dart';
import 'package:txflutterapp/common/demo_tabs.dart';
import 'gridview_count.dart';
import 'gridview_extent.dart';

const List<DemoTabViewModel> demos = [
  DemoTabViewModel(
    title: 'gridview_count',
    widget: GridViewCountDemo(),
  ),
  DemoTabViewModel(
    title: 'gridview_extent',
    widget: GridViewExtentDemo(),
  ),
];

class GridViewDemo extends StatefulWidget {
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
      title: 'gridview组件',
      demos: demos,
      tabController: this.tabController,
    );
  }
}