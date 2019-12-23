import 'dart:convert';
import 'package:ui_test/baseUrl/baseUrl.dart';
import 'package:ui_test/models/NewsPost.dart';
import 'package:ui_test/services/webservice.dart';

class Categorylist {
  static Resource<List<dynamic>> callgetcategorylist() {
    return Resource(
        url: BaseURL.BASE_URL + "news" + "/category" + "/all",
        parse: (response) {
          final result = json.decode(response.body);
          print("final list >>>> $result");

          final output = result;

          return output;
        });
  }
}

class Trendinglist {
  static Resource<List<NewsArticle>> calltrendingnews() {
    return Resource(
        url: BaseURL.BASE_URL + "news/treding",
        parse: (response) {
          final result = json.decode(response.body);
          print("final list Trendinglist>>>> $result");
          Iterable list = result;
          return list.map((model) => NewsArticle.fromJson(model)).toList();
        });
  }
}
