import 'package:flutter/material.dart';

class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: buildGrid(),
    );
  }

  Widget buildGrid() {
    return new GridView.count(
      crossAxisCount: 3, // 列个数
      mainAxisSpacing: 5, // 主轴边距
      crossAxisSpacing: 5,
      children: _buildGridTitleList(30),
    );
  }

  List<Container> _buildGridTitleList(int count) {
    return new List<Container>.generate(
        count,
        (int index) => new Container(
              child: new Column(
                children: <Widget>[
                  new Expanded(
                    child: new Image.network(
                      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585654132198&di=ccebf2d2c3056fc10ba0257b04c3c75b&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Ff%2F58bd29fe40cab.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
//                  new Text(
//                    index.toString(),
//                  )
                ],
              ),
            ));
  }
}
