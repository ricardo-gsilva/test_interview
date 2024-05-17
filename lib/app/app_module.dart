import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_interview/app/controller/api_controller.dart';
import 'package:test_interview/app/controller/cubit/comments_cubit/comments_cubit.dart';
import 'package:test_interview/app/controller/cubit/posts_cubit/posts_cubit.dart';
import 'package:test_interview/app/data/api/api_data.dart';
import 'package:test_interview/app/features/comments/comments_page.dart';
import 'package:test_interview/app/features/home/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(ApiController.new);
    i.add(PostsCubit.new);
    i.add(CommentsCubit.new);
    i.add(DataApi.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/comments', child: (context) => CommentsPage(postId: r.args.data['postId']));
  }
}