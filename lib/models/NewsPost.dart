import 'dart:convert';
import 'package:ui_test/baseUrl/baseUrl.dart';
import 'package:ui_test/services/webservice.dart';

class NewsArticle {
  
final String title; 
final String descrption; 
final String thumbnail; 
final String category;
final String slug;
final String created;
  NewsArticle({this.title, this.descrption, this.thumbnail,this.category,this.slug,this.created});

  factory NewsArticle.fromJson(Map<String,dynamic> json) {
    return NewsArticle(
      title: json['title'], 
      descrption: json['description'], 
      thumbnail: json['thumbnail'] ?? '',
        category: json['category'], 
          slug: json['slug'], 
          created:json['created'],
    );
  
}

  static Resource<List<NewsArticle>> get all {
    
    return Resource(
      url: BaseURL.BASE_URL + 'news/newsbycategory',
      parse: (response) {
        final result = json.decode(response.body); 
       // print("result ${result[0]["suggestedPost"]}");
        Iterable list = result[0]["suggestedPost"];
        return list.map((model) => NewsArticle.fromJson(model)).toList();
      }
    );

  }

}