import 'package:flutter/material.dart';

class OftenUI extends StatelessWidget {
  const OftenUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585646311166&di=5d407688305875d55ff218fc75aada26&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2019-03-23%2F5c95c7b222180.jpg'),
        new Image.asset(
          "images/2.png",
          fit: BoxFit.cover,
        ),
        new Container(
          color: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: new Row(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: new Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      child: new Text(
                        'Oeschinen Lake Campground',
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    new Text(
                      'Kandersteg, Switzerland',
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(right: 10),
                child: new Text(
                  'test11111',
                  textDirection: TextDirection.ltr,
                ),
              ),
              new Text(
                'test2',
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ),

        new Container(
          color: Colors.yellow,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: new Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Column(
                children: <Widget>[
                  new Text(
                    'call',
                    textDirection: TextDirection.ltr,
                  ),
                  new Icon(Icons.call, color: Colors.blue),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Text(
                    'router',
                    textDirection: TextDirection.ltr,
                  ),
                  new Icon(Icons.router, color: Colors.blue),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Text(
                    'share',
                    textDirection: TextDirection.ltr,
                  ),
                  new Icon(Icons.share, color: Colors.blue),
                ],
              ),
            ],
          ),
        ),

        new Container(
          padding: const EdgeInsets.all(16),
          child: new Text(
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true, // 换行
          ),
        ),
//        titleSection,
//        buttonSection,
//        textSection,
      ],
    );
  }
}