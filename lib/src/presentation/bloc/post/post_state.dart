part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

// when ı have error
class PostError extends PostState {
  final String message;

  PostError({required this.message});

  @override
  List<Object> get props => [message];
}

// when ı have data
class PostHasData extends PostState {
  final List<Post> data;

  PostHasData({required this.data});

  @override
  List<Object> get props => [data];
}
