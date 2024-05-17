import 'package:test_interview/app/domain/models/comments_model.dart';
import 'package:test_interview/app/domain/models/posts_model.dart';

abstract class ApiWorkFlow {
  Future<List<PostsModel>> getPosts();

  Future<List<CommentsModel>> getComments(int postId);
}