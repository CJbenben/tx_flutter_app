import 'package:flutter/material.dart';
import 'mock_data.dart';
import 'view/FriendListView.dart';

// 列表中有分割线的使用方法
class ListSeparated extends StatelessWidget {
  const ListSeparated({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        itemCount: friendList.length,
        itemBuilder: (BuildContext context, int index) {
          return new TXFriendView(
            friend: friendList[index],
          );
        },
//        separatorBuilder: (BuildContext context, int index) => const Divider(),
        separatorBuilder: (context, index) {
          return Divider(
            height: .5,
            indent: 55,
            color: Color(0xFFDDDDDD),
          );
        },
      ),
    );
  }
}
