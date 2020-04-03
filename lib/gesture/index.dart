import 'package:flutter/material.dart';
/*
 * 参考文献：
 */

class GestureRecognizerDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<GestureRecognizerDemo>
    with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('手势&触摸事件'),
      ),
      body: homePage(),
    );
  }

  Widget homePage() {
    return new Container(
      alignment: Alignment.center,
      child: new Column(
        children: <Widget>[
          // 1. 按钮本身就有一个触摸事件
          new RaisedButton(
            color: Colors.white10,
            child: new Text(
              'button',
            ),
            onPressed: () {
              print('RaisedButtonAction');
            },
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          // 2. 用 GestureDetector 包裹 child，实现 onTap 方法即可
          new GestureDetector(
            child: new RotationTransition(
              turns: curve,
              child: new Image.asset(
                'images/1.png',
              ),
            ),
            onTap: () {
              print('GestureDetectorAction');
            },
            // 双击
            onDoubleTap: () {
              print('用户在同一个位置快速点击了两下屏幕');
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward();
              }
            },
            // 长按
            onLongPress: () {
              print('用户在同一个位置长时间接触屏幕');
            },
          ),
        ],
      ),
    );
  }
}
