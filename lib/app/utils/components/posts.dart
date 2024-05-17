import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_interview/app/domain/models/posts_model.dart';
import 'package:test_interview/app/utils/consts/core_colors.dart';

class PostsWidget extends StatelessWidget {
  final PostsModel posts;

  const PostsWidget({required this.posts, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Container(            
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Card(            
              color: CoreColors.amber50,
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                splashColor: Colors.black,
                title: Container(
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  color: CoreColors.amber300,
                  child: Text(posts.title)),
                subtitle: Container(
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    color: CoreColors.amber50,
                    child: Text(posts.body)
                ),
                onTap: () async {
                  await Modular.to.pushNamed('/comments',
                    arguments: {
                    'postId': posts.id,
                    }
                  );
                }
              ),
            ),
          ),
        )
    );
  }
}
