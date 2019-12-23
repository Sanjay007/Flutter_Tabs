import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:ui_test/utils/globals.dart' as globals;

class Resource<T> {
  final String url;

  T Function(Response response) parse;

  Resource({this.url, this.parse});
}

class Webservice {
  
  Future<T> getallcategory<T>(Resource<T> resource) async {
    print("${resource.url}");
    print("${globals.newslanguage}");

    final response = await http.get(
      resource.url,
      headers: {'language': globals.newslanguage},
    );
    print("$response");
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<T> gettrendingnews<T>(Resource<T> resource) async {
    print("${resource.url}");
    print("${globals.newslanguage}");

    final response = await http.get(
      resource.url,
      headers: {'language': globals.newslanguage},
    );
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<T> load<T>(Resource<T> resource) async {
    print("loadurl  ${resource.url}");
    var tabcatDef=['sports'];

    print("tabcat  ${globals.tabcategory}");
    var body = json.encode({"category": globals.tabcategory.length>0?globals.tabcategory:tabcatDef});

    final response = await http.post(
      resource.url,
      headers: {
        'language': globals.newslanguage,
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: body,
    );
    print("responsefor $response");

    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<T> getingleNews<T>(Resource<T> resource) async {
    final response = await http.get(
      resource.url,
      headers: {'language': "English"},
    );

    print(response.body+"(((((((((((((((((())))))))))))))))))");
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
