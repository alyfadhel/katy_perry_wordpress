



import 'package:get_it/get_it.dart';
import 'package:wordpress/core/network/dio_helper.dart';
import 'package:wordpress/features/posts/data/datasource/base_article_remote_data_source.dart';
import 'package:wordpress/features/posts/data/repository/posts_repository.dart';
import 'package:wordpress/features/posts/domain/repository/base_post_repository.dart';
import 'package:wordpress/features/posts/domain/usecase/get_posts_usecase.dart';
import 'package:wordpress/features/posts/presentation/controller/cubit/post_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator
{
  Future<void> init()async
  {
    sl.registerFactory(() => PostsCubit(sl()));

    sl.registerLazySingleton(() => GetPostsUseCase(sl()));
    
    sl.registerLazySingleton<BasePostRepository>(
            () => PostRepository(sl()));
    
    sl.registerLazySingleton<BaseArticleRemoteDataSource>(
            () => ArticleRemoteDataSource(sl()));

    sl.registerLazySingleton<DioHelper>(
            () => DioHelperImpl());
  }
}