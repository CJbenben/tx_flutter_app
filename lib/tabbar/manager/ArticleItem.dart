import 'package:flutter/material.dart';
import 'package:txflutterapp/tabbar/manager/Article.dart';

class ArticleItem extends StatelessWidget {
  
  final Article model;

  ArticleItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Container(
                    width: 60, height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(model.articlePic),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text(
                    model.articleTitle,
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('|'+model.desc1, style: TextStyle(fontSize: 14),),
                      Text('|'+model.desc2, style: TextStyle(fontSize: 14),),
                      Text('|'+model.desc3, style: TextStyle(fontSize: 14),),
                    ],
                  )
                ],
              ),
              Container(height: 10.0,),
              Divider(height: 1.0, indent: 0.0, color: Colors.grey,),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    model.content,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}