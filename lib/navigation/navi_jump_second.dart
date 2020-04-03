import 'package:flutter/material.dart';

class NaviNextAction extends StatelessWidget {
  const NaviNextAction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _popLastvc() {
      Navigator.pop(context);
    }

    _body() {
      return new Center(
        child: new Column(
          children: <Widget>[
            new MaterialButton(
              color: Colors.yellow,
              minWidth: 200,
              child: Text(
                'back last vc',
              ),
              onPressed: () {
                _popLastvc();
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            // ButtonBar 为布局组件，可以让 button 排列在一行
            new ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                new CloseButton(),
                new IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: _popLastvc,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            // FloatingActionButton 是一个悬浮在页面右下角的悬浮按钮
            new FloatingActionButton(
              elevation: 3,
              backgroundColor: Colors.red,
              child: new Icon(Icons.add_a_photo),
              onPressed: _popLastvc,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            new MaterialButton(
              color: Colors.yellow,
              minWidth: 200,
              child: Text(
                'back last vc with return',
              ),
              onPressed: () {
                var dict = {
                  'key': 'value',
                  'param': 'chenxiaojie',
                };
                Navigator.of(context).pop(dict);
              },
            ),
          ],
        ),
      );
    }

    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Next VC'),
      ),
      body: _body(),
    );
  }
}
