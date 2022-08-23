import 'package:news/constants/constants.dart';

class DbModel{
  String? title;
  String? content;
  String? urlToImage;
  String? publishedAt;
  String? name;

  DbModel({this.publishedAt,this.name,this.content,this.title,this.urlToImage});

  toMap() => {
    kTitle : title,
    kName : name,
    kContent : content,
    kPublishedAt : publishedAt,
    kUrlToImage : urlToImage
  };

  factory DbModel.fromMap(Map map){
    return DbModel(
      name: map[kName] ?? map["source"][kName],
      title: map[kTitle],
      content: map[kContent],
      urlToImage: map[kUrlToImage],
      publishedAt: map[kPublishedAt]
    );
  }
}