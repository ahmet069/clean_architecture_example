// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserError extends UserState {
  final String message;
  UserError({required this.message});
  @override
  List<Object> get props => [message];
}

class UserHasData extends UserState {
  final List<User> data;
  UserHasData({required this.data});

  @override
  List<Object> get props => [data];
}
