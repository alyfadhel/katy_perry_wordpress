import 'package:wordpress/features/posts/domain/entities/posts.dart';

abstract class PostsState{}

class InitialPostState extends PostsState{}

class GetPostLoadingState extends PostsState{}
class GetPostSuccessState extends PostsState{
  final List<Article>posts;

  GetPostSuccessState(this.posts);
}
class GetPostErrorState extends PostsState{
  final String error;

  GetPostErrorState(this.error);
}