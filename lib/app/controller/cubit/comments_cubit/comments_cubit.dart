import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_interview/app/controller/api_controller.dart';
import 'package:test_interview/app/domain/models/comments_model.dart';

part 'comments_states.dart';

class CommentsCubit extends Cubit<CommentsStates> {
  CommentsCubit() : super(CommentsInitial());
  final api = Modular.get<ApiController>();

  Future<void> getComments(int postId) async {
    emit(CommentsLoading());
    try {
      final comments = await api.getComments(postId);
      emit(CommentsSucess(comments));
    } catch (e) {
      emit(CommentsError("Não foi possível carregar a lista de postagens."));
    }
  }
}