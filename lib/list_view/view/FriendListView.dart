import 'package:flutter/material.dart';

class TXFriendViewModel {
  final String userName;
  final String userImgUrl;
  final String msgContent;
  final String msgTime;

  const TXFriendViewModel({
    this.userName,
    this.userImgUrl,
    this.msgContent,
    this.msgTime,
  });
}

class TXFriendView extends StatelessWidget {
  final TXFriendViewModel friend;
  const TXFriendView({
    Key key,
    this.friend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.all(10),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Image.network(
            friend.userImgUrl,
            width: 40,
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
          ),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      friend.userName,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF333333),
                      ),
                    ),
                    new Text(
                      friend.msgTime,
                    ),
                  ],
                ),
                new Container(
                  padding: EdgeInsets.only(right: 60),
                  child: new Text(
                    friend.msgContent,
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF666666),
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
