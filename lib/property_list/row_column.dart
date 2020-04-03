import 'package:flutter/material.dart';

class RowAndColumnProperty extends StatelessWidget {
  const RowAndColumnProperty({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '这个是 Row1',
          ),
          new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(left:10, right: 10),
                child: Text(
                  '这个是 Column1',
                ),
              ),
              Text(
                '这个是 Column2',
                textDirection: TextDirection.ltr,
              ),
              new Image.asset(
                "images/1.png",
              ),
            ],
          ),
          Text(
            '这个是 Row3',
          ),
        ],
      ),
    );
  }
}
