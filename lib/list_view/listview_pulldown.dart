import 'package:flutter/material.dart';
import 'mock_data.dart';
import 'package:toast/toast.dart';
import 'view/FriendListView.dart';

// 下拉加载,列表数据源可变，选择 StatefulWidget,不可变选择 StatelessWidget 即可
class ListPullDownRefresh extends StatefulWidget {
  const ListPullDownRefresh({Key key}) : super(key: key);
  _PullDownRefreshListState createState() => _PullDownRefreshListState();
}

class _PullDownRefreshListState extends State<ListPullDownRefresh> {
  Future onRefresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        Toast.show('已经是最新数据了', context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RefreshIndicator(
      onRefresh: this.onRefresh,
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
