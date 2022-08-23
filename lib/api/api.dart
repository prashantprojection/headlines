import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news/database/database.dart';
import 'package:news/model/database_model.dart';

import '../constants/apiKey.dart';

class API {
  DBHelper db = DBHelper();
  DbModel model = DbModel();
  topHeadlines() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey");
    try{
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      db.empty();
      Map json = jsonDecode(response.body);
      List list = json["articles"];
      list.forEach((e) async{
        await db.insert(DbModel.fromMap(e));
      });
      return List.from(list).map((e){
        return DbModel.fromMap(e);
      }).toList();
    }}on SocketException catch(_) {
      return await db.fetch();
    }
  }
}
