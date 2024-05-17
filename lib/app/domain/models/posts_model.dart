// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostsModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  
  PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  PostsModel.empty():
    userId = 0,
    id = 0,
    title = "",
    body = "";  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsModel.fromJson(String source) => PostsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Posts(userId: $userId, id: $id, title: $title, body: $body)';
  }
}
