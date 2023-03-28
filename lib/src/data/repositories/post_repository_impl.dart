import 'package:clean_architecture_example/src/data/datasource/remote/post/post_remote_data_source.dart';
import 'package:clean_architecture_example/src/domain/entities/post/post.dart';
import 'package:clean_architecture_example/src/core/network/network_exceptions.dart';
import 'package:clean_architecture_example/src/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PostRepositoryImpl extends PostRepository {
  final PostRemoteDateSource _postRemoteDateSource;

  PostRepositoryImpl(this._postRemoteDateSource);
  @override
  Future<Either<NetworkExceptions, List<Post>>> getAllPosts() async {
    try {
      final result = await _postRemoteDateSource.GetAllPost();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioError catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }
}
