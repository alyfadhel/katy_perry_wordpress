import 'dart:convert';

import 'package:wordpress/core/network/dio_helper.dart';
import 'package:wordpress/core/network/end-points.dart';
import 'package:wordpress/features/posts/data/models/posts_model.dart';

abstract class BaseArticleRemoteDataSource {
  Future<List<ArticleModel>> fetchArticles();
}

class ArticleRemoteDataSource extends BaseArticleRemoteDataSource {
  final DioHelper dioHelper;

  ArticleRemoteDataSource(this.dioHelper);

  @override
  Future<List<ArticleModel>> fetchArticles() async {
    final response = await dioHelper.get(
      endPoint: postEndPoint,
    );

    return List<ArticleModel>.from(
        (response as List).map((e) => ArticleModel.fromJson(e)));
  }
}
