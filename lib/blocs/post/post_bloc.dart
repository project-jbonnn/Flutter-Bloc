import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mfajriansyah_flutter_test/data/models/post_model.dart';

import '../../data/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final _postRepository = PostRepository();

  PostBloc() : super(LoadingState()) {
    on<PostEvent>((event, emit) async {
      if (event is GetIdEvent) {
        try {
          emit(LoadingState());
          final id = await _postRepository.getById(event.id);
          emit(LoadedState(postModel: id!, posts: [id]));
        } catch (e) {
          emit(FailedLoadState(error: e.toString()));
        }
      } else if (event is LoadEvent || event is PullToRefreshEvent) {
        emit(LoadingState());
        try {
          final posts = await _postRepository.getPost();
          emit(LoadedState(posts: posts));
        } catch (e) {
          emit(FailedLoadState(error: e.toString()));
        }
      }
    });
  }
}
