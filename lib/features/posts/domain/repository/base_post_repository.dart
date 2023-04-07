import 'package:dartz/dartz.dart';
import 'package:wordpress/core/error/failure.dart';
import 'package:wordpress/features/posts/domain/entities/posts.dart';

abstract class BasePostRepository
{
  Future<Either<Failure,List<Article>>>fetchArticles();
}