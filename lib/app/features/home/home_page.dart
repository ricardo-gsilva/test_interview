import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_interview/app/utils/components/posts.dart';
import 'package:test_interview/app/controller/cubit/posts_cubit/posts_cubit.dart';
import 'package:test_interview/app/utils/consts/core_colors.dart';
import 'package:test_interview/app/utils/consts/core_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final postsCubit = Modular.get<PostsCubit>();

  @override
  void initState() {
    postsCubit.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(CoreStrings.posts),
          centerTitle: true,
        ),
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<PostsCubit, PostsStates>(
              bloc: postsCubit,
              builder: (context, state) {
                if (state is PostsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: CoreColors.amber,
                    ),
                  );
                } else if (state is PostsSuccess) {
                  if (state.posts.isEmpty) {
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
                          Text("Não há nenhuma postagem")
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          return PostsWidget(posts: state.posts[index]);
                    });
                  }
                } else if (state is PostsError) {
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
                return SliverToBoxAdapter(child: Container(),);
              }
            ),
          ),
        ),
      ),
    );
  }
}
