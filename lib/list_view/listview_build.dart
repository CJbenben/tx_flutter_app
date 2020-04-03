import 'package:flutter/material.dart';
import 'mock_data.dart';

class ListBuild extends StatelessWidget {
  const ListBuild({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      child: ListView.builder(
        // 列表中的数量
        itemCount: dataAry.length,
        // 子元素渲染方法
        itemBuilder: (context, index) {
          return SubscribeAccountCard(
            data: dataAry[index],
          );
        },
      ),
    );
  }
}

class AccountViewModel {
  final String accountImgUrl;
  final String accountName;
  final List<Article> articles;
  final String publishTime;

  const AccountViewModel({
    this.accountImgUrl,
    this.accountName,
    this.articles,
    this.publishTime,
  });
}

class Article {
  /// 封面图
  final String coverImgUrl;

  /// 文章标题
  final String title;

  const Article({
    this.coverImgUrl,
    this.title,
  });
}

class SubscribeAccountCard extends StatelessWidget {
  final AccountViewModel data;

  const SubscribeAccountCard({
    Key key,
    this.data,
  }) : super(key: key);

  Widget renderAcctionInfo() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            children: <Widget>[
              CircleAvatar(
                radius: 15,
//                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(this.data.accountImgUrl),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                this.data.accountName,
              ),
            ],
          ),
          new Text(
            this.data.publishTime,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }

  Widget articleContent() {
    final article = this.data.articles[0];
    final shouldClip = this.data.articles.length <= 1;

    return ClipRRect(
      borderRadius: !shouldClip
          ? BorderRadius.circular(10)
          : BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          new Image.network(
            article.coverImgUrl,
            height: 150,
            fit: BoxFit.cover,
          ),
          new Positioned(
            left: 0,
            right: 0,
            height: 150,
            child: new Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black54],
              )),
              child: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderArticles() {
    final articles = this.data.articles.sublist(1);
    return ListView.separated(
      shrinkWrap: true,// 这个玩意必须设置
      itemCount: articles.length,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return Container(
          height: 0.5,
          color: Color(0xFFDDDDDD),
        );
      },
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  articles[index].title,
                ),
              ),
              Image.network(
                articles[index].coverImgUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: new Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(
        children: <Widget>[
          this.renderAcctionInfo(),
          this.articleContent(),
          this.renderArticles(),
        ],
      ),
    );
  }
}
