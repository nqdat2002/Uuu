// To parse this JSON data, do
//
//     final NewsApiResponse = NewsApiResponseFromJson(jsonString);
import 'dart:convert';

import 'package:intl/intl.dart';

class NewsApiResponse {
  String status;
  int totalResults;
  List<Article> articles;

  NewsApiResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsApiResponse.fromRawJson(String str) =>
      NewsApiResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) => NewsApiResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles:List<Article>.from(
                json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  // String? category;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    // this.category,
    this.content,
  });

  factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        // category: json['category'],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        // "category": category,
        "content": content,
      };
  String getTime() {
    var formatter = DateFormat('dd MMMM yyyy h:m');
    String formatted = formatter.format(publishedAt!);
    return formatted;
  }

  String getDateOnly() {
    var formatter = DateFormat('dd MMMM yyyy');
    String formatted = formatter.format(publishedAt!);
    return formatted;
  }
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
