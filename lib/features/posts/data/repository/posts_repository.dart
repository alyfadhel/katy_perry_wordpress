import 'package:dartz/dartz.dart';
import 'package:wordpress/core/error/exceptions.dart';
import 'package:wordpress/core/error/failure.dart';
import 'package:wordpress/features/posts/data/datasource/base_article_remote_data_source.dart';
import 'package:wordpress/features/posts/domain/entities/posts.dart';
import 'package:wordpress/features/posts/domain/repository/base_post_repository.dart';

class PostRepository extends BasePostRepository{
  final BaseArticleRemoteDataSource baseArticleRemoteDataSource;

  PostRepository(this.baseArticleRemoteDataSource);
  @override
  Future<Either<Failure, List<Article>>> fetchArticles() async{
    final result =  await baseArticleRemoteDataSource.fetchArticles();

    try {
      return Right(
        result,
      );
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.message,
        ),
      );
    }
  }

}