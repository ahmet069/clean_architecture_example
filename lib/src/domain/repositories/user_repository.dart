import '../../core/network/network_exceptions.dart';
import 'package:dartz/dartz.dart';

import '../entities/user/user.dart';

abstract class UserRepository {
  Future<Either<NetworkExceptions, List<User>>> getAllUsers();
  Future<String> deleteUser() async => 'enes';
  Future<void> createUser();
  // Future<void> updateUser();
}
