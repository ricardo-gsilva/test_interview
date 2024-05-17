import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_interview/app/controller/api_controller.dart';
import 'package:test_interview/app/domain/models/posts_model.dart';

part 'posts_states.dart';

class PostsCubit extends Cubit<PostsStates>{
  PostsCubit() : super(PostsInitial());
  final api = Modular.get<ApiController>();

  Future<void> getPosts() async {
    emit(PostsLoading());
    try {
      final posts = await api.getPosts();
      emit(PostsSuccess(posts));
    } catch (e) {
      emit(PostsError("Não foi possível carregar a lista de postagens."));
    }
  }
}