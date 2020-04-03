import 'package:flutter/material.dart';
/*
 *  参考文献：https://www.jianshu.com/p/ee243d5d0a41
 */

/// 基础动画模块
class AnimateComplex extends StatefulWidget {
  const AnimateComplex({Key key}) : super(key: key);
  _BasicAnimateState createState() => _BasicAnimateState();
}

class _BasicAnimateState extends State<AnimateComplex>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    /// 动画状态监听
    animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          debugPrint('动画完成');
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          debugPrint('动画消失');
          controller.forward();
//        controller.dispose();
        }
      },
    );
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
    debugPrint('dispose 执行了');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AnimationImg(animation: animation);
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
            '开始动画',
          ),
          onPressed: () {
            // 启动动画
            controller.forward();
          },
        ),
      ],
    );
  }
}

class AnimationImg extends AnimatedWidget {
  static final _opacityTween = new Tween<double>(begin: 0.0, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300);
  AnimationImg({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: new Image.asset(
            'images/3.png',
          ),
        ),
      ),
    );
  }
}
