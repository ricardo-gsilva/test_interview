import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_interview/app/utils/components/comments.dart';
import 'package:test_interview/app/controller/cubit/comments_cubit/comments_cubit.dart';
import 'package:test_interview/app/utils/consts/core_colors.dart';
import 'package:test_interview/app/utils/consts/core_strings.dart';

class CommentsPage extends StatefulWidget {
  final int postId;

  const CommentsPage({required this.postId, super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final commentsCubit = Modular.get<CommentsCubit>();

  @override
  void initState() {
    commentsCubit.getComments(widget.postId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CoreStrings.comments),
        centerTitle: true,
      ),
      body: BlocBuilder<CommentsCubit, CommentsStates>(
          bloc: commentsCubit,
          builder: (context, state) {
            if (state is CommentsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: CoreColors.amber,
                ),
              );
            } else if (state is CommentsSucess) {
              if (state.comments.isEmpty) {
                return const SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.not_interested,
                        size: 30,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Não há nenhum comentário")
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: state.comments.length,
                    itemBuilder: (context, index) {
                      return CommentsWidget(comments: state.comments[index]);                      
                    });
              }
            } else if (state is CommentsError) {
              return SliverFillRemaining(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.not_interested,
                      size: 30,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(state.error)
                  ],
                ),
              );
            }
            return SliverToBoxAdapter(
              child: Container(),
            );
          }),
    );
  }
}
