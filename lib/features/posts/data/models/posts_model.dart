import 'package:wordpress/features/posts/domain/entities/posts.dart';
import 'dart:convert';

class ArticleModel extends Article {
  const ArticleModel({
    required super.id,
    required super.title,
    required super.content,
    required super.link,

  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title']['rendered'],
      content: json['content']['rendered'].toString(),
      link: json['link']
    );

  }

}
