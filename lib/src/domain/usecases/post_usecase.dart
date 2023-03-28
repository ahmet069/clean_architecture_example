import '../../core/network/network_exceptions.dart';
import 'package:clean_architecture_example/src/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/post/post.dart';

class PostUsecase {
  final PostRepository _repository;

  PostUsecase(this._repository);

  Future<Either<NetworkExceptions, List<Post>>> getAllPosts() async => _repository.getAllPosts();
}
