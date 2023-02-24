import 'dart:convert';

import 'article.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Free api
  final String newsAPI =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0c7c519c61c745bc8b8a1889a7529d5d";
  Future<List<Article>> fetchArticle() async {
    final response = await http.get(Uri.parse(newsAPI));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return Article.fromJson(jsonDecode(response.body));
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic e) => Article.fromJson(e)).toList();

      return articles;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load article');
    }
  }
}
