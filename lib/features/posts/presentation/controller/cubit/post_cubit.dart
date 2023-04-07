import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress/core/usecase/base_use_case.dart';
import 'package:wordpress/features/posts/domain/entities/posts.dart';
import 'package:wordpress/features/posts/domain/usecase/get_posts_usecase.dart';
import 'package:wordpress/features/posts/presentation/controller/cubit/post_state.dart';

class PostsCubit extends Cubit<PostsState>
{
  final GetPostsUseCase getPostsUseCase;
  List<Article>posts = [];
  PostsCubit(
      this.getPostsUseCase,
      ): super(InitialPostState());

  static PostsCubit get(context)=>BlocProvider.of(context);

  void getAllPosts()async
  {
    emit(GetPostLoadingState());
    final result = await getPostsUseCase(const NoParameters());

    result.fold(
            (l){
              emit(GetPostErrorState(l.message));
            },
            (r){
              posts = r;
              emit(GetPostSuccessState(r));
            });
  }



}