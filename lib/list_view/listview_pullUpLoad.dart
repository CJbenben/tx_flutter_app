import 'package:flutter/material.dart';
import 'mock_data.dart';
import 'view/FriendListView.dart';

// 下拉加载,列表数据源可变，选择 StatefulWidget,不可变选择 StatelessWidget 即可
class ListPullUpLoad extends StatefulWidget {
  const ListPullUpLoad({Key key}) : super(key: key);
  _PullUpLoadMoreList createState() => _PullUpLoadMoreList();
}

class _PullUpLoadMoreList extends State<ListPullUpLoad> {
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  List<TXFriendViewModel> list = List.from(friendList);

  void initState() {
    super.initState();
    this.scrollController.addListener(() {
      if (!this.isLoading &&
          this.scrollController.position.pixels >=
              this.scrollController.position.maxScrollExtent) {
        setState(() {
          this.isLoading = true;
          this.loadMoreData();
        });
      }
    });
  }

  void dispose() {
    super.dispose();
    this.scrollController.dispose();
  }

  Future loadMoreData() {
    return Future.delayed(Duration(seconds: 2), () {
      setState(() {
        this.isLoading = false;
        this.list.addAll(friendList);
      });
    });
  }

  Widget renderBottom() {
    if (this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: new Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      controller: this.scrollController,
      itemCount: this.list.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index < this.list.length) {
          return new TXFriendView(
            friend: this.list[index],
          );
        } else {
          return this.renderBottom();
        }
      },
//        separatorBuilder: (BuildContext context, int index) => const Divider(),
      separatorBuilder: (context, index) {
        return Divider(
          height: .5,
          indent: 55,
          color: Color(0xFFDDDDDD),
        );
      },
    );
  }
}
