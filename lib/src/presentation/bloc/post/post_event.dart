part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
  @override
  List<Object> get props => [];
}

class GetAllPosts extends PostEvent {
  const GetAllPosts();
}

class FilterPosts extends PostEvent {
  final String text;
  const FilterPosts({required this.text});
}
