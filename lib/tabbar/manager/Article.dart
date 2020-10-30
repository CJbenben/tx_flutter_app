import 'dart:convert';

class Article {

  final String articleTitle;
  final String desc1;
  final String desc2;
  final String desc3;
  final String articlePic;
  final String content;

  //构造函数
  Article({
    this.articleTitle,
    this.desc1,
    this.desc2,
    this.desc3,
    this.articlePic,
    this.content,
  });

  //string -> List<Article>
  static List<Article> resolveDataFromJsonString(String json) {
    List<Article> listModel = new List<Article>();
    List list = jsonDecode(json)['list'];
    list.forEach((element) {
      var model = new Article(
        articlePic: element['articlePic'],
        articleTitle: element['articleTitle'],
        desc1: element['desc1'],
        desc2: element['desc2'],
        desc3: element['desc3'],
        content: element['content'],
      );
      listModel.add(model);
     });

    return listModel;
  }

}