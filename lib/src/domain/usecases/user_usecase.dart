import 'package:clean_architecture_example/src/domain/repositories/user_repository.dart';
import '../../core/network/network_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../entities/user/user.dart';

class UserUsecase {
  final UserRepository _repository;

  UserUsecase(this._repository);

  Future<Either<NetworkExceptions, List<User>>> getAllUsers() async => _repository.getAllUsers();
}
