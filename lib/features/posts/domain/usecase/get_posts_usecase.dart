import 'package:dartz/dartz.dart';
import 'package:wordpress/core/error/failure.dart';
import 'package:wordpress/core/usecase/base_use_case.dart';
import 'package:wordpress/features/posts/domain/entities/posts.dart';
import 'package:wordpress/features/posts/domain/repository/base_post_repository.dart';

class GetPostsUseCase extends BaseUseCase<List<Article>, NoParameters> {
  final BasePostRepository basePostRepository;

  GetPostsUseCase(this.basePostRepository);

  @override
  Future<Either<Failure, List<Article>>> call(NoParameters parameters) async {
    return await basePostRepository.fetchArticles();
  }
}
