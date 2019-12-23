import 'dart:convert';
import 'package:ui_test/baseUrl/baseUrl.dart';
import 'package:ui_test/services/webservice.dart';
import 'package:ui_test/models/NewsPost.dart';
class NewDetails {
  
  final String title;
  final String description;
  final String thumbnail;
  final String postedDate;
final List<NewsArticle> suggestedPost;

  NewDetails({this.title, this.description, this.thumbnail, this.postedDate,this.suggestedPost});

  factory NewDetails.fromJson(Map<String, dynamic> json) {
    return NewDetails(
      title: json['article']['title'],
      description: json['article']['description'],
      thumbnail: json['article']['thumbnail'] ?? '',
      postedDate: json['article']['postedDate'],
      suggestedPost: (json['suggestedPost'] as List).map((i) => NewsArticle.fromJson(i)).toList()

    );
  }

  static Resource<NewDetails> singleNews(String category, String slug) {
    return Resource(
        url: BaseURL.BASE_URL + category + "/" + slug,
        parse: (response) {
          final result = json.decode(response.body);

          final output = result['article'];
          NewDetails dt = NewDetails.fromJson(result);
          print(dt);

          return NewDetails.fromJson(result);
        });
  }
}
