import 'package:flutter/material.dart';
/*
 *  参考文献：https://www.jianshu.com/p/ee243d5d0a41
 */


/// 基础动画模块
class BasicAnimate extends StatefulWidget {
  const BasicAnimate({Key key}) : super(key: key);
  _BasicAnimateState createState() => _BasicAnimateState();
}

class _BasicAnimateState extends State<BasicAnimate>
    with TickerProviderStateMixin {
  AnimationController controller_position;
  AnimationController controller_scale;
  AnimationController controller_rotation;
  AnimationController controller_opacity;
  CurvedAnimation curve;
  Animation<Offset> animation;
  Animation<double> animation3;
  Animation<double> animation4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller_position = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    controller_scale = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    controller_rotation = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    controller_opacity = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    /// 平移动画状态监听
    controller_position.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        debugPrint('动画完成');
        controller_position.reverse();
      } else if (status == AnimationStatus.dismissed) {
        debugPrint('动画消失');
//        controller.forward();
//        controller.dispose();
      }
    });

    /// 缩放动画状态监听
    controller_scale.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        debugPrint('动画完成');
        controller_scale.reverse();
      } else if (status == AnimationStatus.dismissed) {
        debugPrint('动画消失');
//        controller.forward();
//        controller.dispose();
      }
    });

    /// 旋转动画状态监听
    controller_rotation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        debugPrint('动画完成');
        controller_rotation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        debugPrint('动画消失');
//        controller.forward();
//        controller.dispose();
      }
    });
    curve = CurvedAnimation(parent: controller_position, curve: Curves.easeIn);
    animation = Tween(
      begin: Offset(-0.25, 0),
      end: Offset(0.25, .1),
    ).animate(controller_position);
    animation3 = Tween(
      begin: 0.0,
      end: 0.25,
    ).animate(controller_rotation);

    animation4 = Tween(
      begin: 1.0,
      end: .05,
    ).animate(controller_opacity);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller_position.dispose();
    controller_scale.dispose();
    controller_rotation.dispose();
    controller_opacity.dispose();
    super.dispose();
    debugPrint('dispose 执行了');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      alignment: Alignment.topLeft,
      child: new ListView(
        children: <Widget>[
          topButtonAry(),
          new FadeTransition(opacity: animation4,
            child: new Container(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 100),
              color: Colors.blue,
              height: 100,
              width: 100,
            ),
          ),
          new SlideTransition(
            textDirection: TextDirection.ltr,
            position: animation,
            child: new Image.asset(
              'images/1.png',
            ),
          ),
          new ScaleTransition(
            scale: controller_scale,
            child: new Image.asset(
              'images/2.png',
            ),
          ),
          new RotationTransition(
            turns: animation3,
            child: new Image.asset(
              'images/3.png',
            ),
          ),
        ],
      ),
    );
  }

  Widget topButtonAry() {
    return new ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        new MaterialButton(
          minWidth: 10,
//          height: 30,
          color: Colors.yellow,
          child: new Text(
            '平移',
          ),
          onPressed: () {
            // 启动动画
            controller_position.forward();
          },
        ),
        new MaterialButton(
          minWidth: 10,
//          height: 30,
          color: Colors.yellow,
          child: new Text(
            '缩放',
          ),
          onPressed: () {
            // 启动动画
            controller_scale.forward();
          },
        ),
        new MaterialButton(
          minWidth: 10,
//          height: 30,
          color: Colors.yellow,
          child: new Text(
            '旋转',
          ),
          onPressed: () {
            // 启动动画
            controller_rotation.forward();
          },
        ),
        new MaterialButton(
          minWidth: 10,
//          height: 30,
          color: Colors.yellow,
          child: new Text(
            '透明度',
          ),
          onPressed: () {
            // 启动动画
            controller_opacity.forward();
          },
        ),
      ],
    );
  }
}
