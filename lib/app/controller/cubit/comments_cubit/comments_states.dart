part of 'comments_cubit.dart';

abstract class CommentsStates {}

class CommentsInitial extends CommentsStates {}

class CommentsLoading extends CommentsStates {}

class CommentsSucess extends CommentsStates {
  CommentsSucess(this.comments);

  final List<CommentsModel> comments;
}

class CommentsError extends CommentsStates {
  CommentsError(this.error);

  final String error;
}