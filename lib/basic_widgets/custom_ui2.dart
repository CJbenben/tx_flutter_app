import 'package:flutter/material.dart';

class OftenUI2 extends StatelessWidget {
  const OftenUI2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _leftSection(),
        _imageSection(),
      ],
    );
  }

  _imageSection() {
    return new Container(
        width: 240,
//      height: 400,
        padding: const EdgeInsets.all(10),
        decoration: new BoxDecoration(
          color: Colors.yellow,
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Container(
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(10.0)),
                ),
                child: new Image.asset(
                  'images/1.png',
                ),
              ),
            ),
            new Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 0),
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.green,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: new Image.asset(
                  'images/1.png',
                ),
              ),
            ),
            new Expanded(
              child: new Container(
                decoration: new BoxDecoration(
                  color: Colors.pink,
                  border: new Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: new Image.asset(
                  'images/1.png',
                ),
                constraints: new BoxConstraints.expand(),
              ),
            ),
            new Image.network(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585572847225&di=17c5f9bc939f45f5f37ab2ae086f95c1&imgtype=0&src=http%3A%2F%2Fhimg2.huanqiu.com%2Fattachment2010%2F2012%2F0810%2F20120810091531311.jpg")
          ],
        ));
  }

  _leftSection() {
    return new Container(
        color: Colors.red,
//      decoration: new BoxDecoration(
//        border: new Border.all(
//          color: Colors.yellow,
//        )
//      ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              'column111',
            ),
            new Text(
              'column222adl',
              softWrap: true,
            ),
            new Column(
              children: <Widget>[
                new Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                new Text('PREP')
              ],
            ),
            new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Icon(
                  Icons.star,
                  color: Colors.green[500],
                ),
                new Icon(
                  Icons.star,
                  color: Colors.green[800],
                ),
                new Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                new Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                new Icon(
                  Icons.star,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ));
  }
}
