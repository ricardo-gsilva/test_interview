import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_interview/app/data/api/api_data.dart';
import 'package:test_interview/app/domain/business/api_workflow.dart';
import 'package:test_interview/app/domain/models/comments_model.dart';
import 'package:test_interview/app/domain/models/posts_model.dart';

class ApiController implements ApiWorkFlow {
  final dataApi = Modular.get<DataApi>();
  
  @override
  Future<List<PostsModel>> getPosts() {
    return dataApi.getPosts();
  }

  @override
  Future<List<CommentsModel>> getComments(int postId) {
    return dataApi.getComments(postId);
  }  
}
