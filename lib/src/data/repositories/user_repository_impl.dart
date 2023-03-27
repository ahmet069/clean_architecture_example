// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/network/network_exceptions.dart';
import '../../domain/entities/user/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasource/remote/user/user_remote_data_source.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _remoteDataSource;
  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<NetworkExceptions, List<User>>> getAllUsers() async {
    try {
      final result = await _remoteDataSource.getAllUsers();

      return Right(result.map((e) => e.toEntity()).toList());
    } on DioError catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }

  @override
  Future<void> createUser() {
    _remoteDataSource.getAllUsers2();
    throw UnimplementedError();
  }
}
