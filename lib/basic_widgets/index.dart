import 'package:flutter/material.dart';
import 'package:txflutterapp/common/demo_tabs.dart';
import 'image.dart';
import 'basic_textField.dart';
import 'custom_ui.dart';
import 'custom_ui2.dart';

const List<DemoTabViewModel> demos = [
  DemoTabViewModel(
    title: '图片用法',
    widget: BasicImages(),
  ),
  DemoTabViewModel(
    title: 'textField & btn用法',
    widget: BasicTextField(),
  ),
  DemoTabViewModel(
    title: '复杂 UI 1',
    widget: OftenUI(),
  ),
  DemoTabViewModel(
    title: '复杂 UI 2',
    widget: OftenUI2(),
  ),
];

class BasicWidgetsDemo extends StatefulWidget {
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