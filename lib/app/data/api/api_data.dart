import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_interview/app/domain/models/comments_model.dart';
import 'package:test_interview/app/domain/models/posts_model.dart';
import 'package:test_interview/app/utils/consts/api.dart';

class DataApi {
  Future<List<PostsModel>> getPosts() async {
    var urlParse = "$url/posts";
    List<PostsModel> postsList = [];

    final response = await http.get(Uri.parse(urlParse));
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body);
      list.map((e){
        postsList.add(PostsModel.fromMap(e));
      }).toList();
      
      return postsList;
    } else {
      return List<PostsModel>.empty();
    }
  }

  Future<List<CommentsModel>> getComments(int id) async {    
    var urlParse = "$url/posts/$id/comments";
    List<CommentsModel> commentsList = [];

    final response = await http.get(Uri.parse(urlParse));
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body);
      list.map((e){
        commentsList.add(CommentsModel.fromMap(e));
      }).toList();
      
      return commentsList;
    } else {
      return List<CommentsModel>.empty();
    }
  }
}