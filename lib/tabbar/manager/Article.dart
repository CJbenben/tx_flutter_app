import 'dart:convert';

class Article {
  final String market_name;
  final String name;
  final String url;
  final String downCount;// 下载次数
  final String desc1;
  final String desc2;
  final String desc3;
  final String bottom;

  Article({this.market_name, this.name, this.url, this.downCount, this.desc1, this.desc2, this.desc3, this.bottom});

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
        market_name: json['market_name'],
        name: json['name'],
        url: json['logo_url'],
        downCount: json['download_times_fixed'],
        desc1: json['type'],
        desc2: json['tag'],
        desc3: json['market_id'],
        bottom: json['single_word']);
  }

}