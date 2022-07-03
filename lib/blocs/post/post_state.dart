part of 'post_bloc.dart';

@immutable
abstract class PostState{}

class PostInitial extends PostState {}

class LoadingState extends PostState {}

class LoadedState extends PostState {
  PostModel? postModel;
  List<PostModel> posts;

  LoadedState({this.postModel, required this.posts});
}

class FailedLoadState extends PostState {
  String error;

  FailedLoadState({required this.error});
}
