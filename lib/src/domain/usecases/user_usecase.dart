// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_example/src/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/network/network_exceptions.dart';
import '../entities/user/user.dart';

class UserUsecase {
  final UserRepository _repository;

  UserUsecase(this._repository);

  Future<Either<NetworkExceptions, List<User>>> getAllUsers() async =>
      _repository.getAllUsers();
}
