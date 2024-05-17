part of 'posts_cubit.dart';

abstract class PostsStates {}

class PostsInitial extends PostsStates {}

class PostsLoading extends PostsStates{}

class PostsSuccess extends PostsStates{
  PostsSuccess(this.posts);
  final List<PostsModel> posts;
}

class PostsError extends PostsStates{
  PostsError(this.error);

  final String error;
}