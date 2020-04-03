import 'package:flutter/material.dart';
import 'package:txflutterapp/common/demo_tabs.dart';
import 'package:txflutterapp/property_list/padding.dart';
import 'margin.dart';
import 'padding.dart';
import 'constraints_property.dart';
import 'row_column.dart';
import 'expanded.dart';

const List<DemoTabViewModel> demos = [
  DemoTabViewModel(
    title: 'margin用法',
    widget: MarginProperty(),
  ),
  DemoTabViewModel(
    title: 'padding用法',
    widget: PaddingProperty(),
  ),
  DemoTabViewModel(
    title: '约束用法',
    widget: ConstraintsProperty(),
  ),
  DemoTabViewModel(
    title: 'row&column用法',
    widget: RowAndColumnProperty(),
  ),
  DemoTabViewModel(
    title: 'expanded用法',
    widget: ExpandedProperty(),
  ),
];

class PropertyListDemo extends StatefulWidget {
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
      title: '属性列表',
      demos: demos,
      tabController: this.tabController,
    );
  }
}