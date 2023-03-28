import 'package:clean_architecture_example/src/core/network/network_exceptions.dart';
import 'package:clean_architecture_example/src/domain/entities/post/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<NetworkExceptions, List<Post>>> getAllPosts();
}
