part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class GetIdEvent extends PostEvent {
  int id;

  GetIdEvent({required this.id});
}

class LoadEvent extends PostEvent {}

class PullToRefreshEvent extends PostEvent {}
 