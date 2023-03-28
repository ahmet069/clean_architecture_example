import 'package:clean_architecture_example/src/core/network/dio_client.dart';
import 'package:clean_architecture_example/src/data/datasource/remote/post/post_remote_data_source.dart';
import 'package:clean_architecture_example/src/data/datasource/remote/user/user_remote_data_source.dart';
import 'package:clean_architecture_example/src/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture_example/src/domain/repositories/post_repository.dart';
import 'package:clean_architecture_example/src/domain/repositories/user_repository.dart';
import 'package:clean_architecture_example/src/domain/usecases/post_usecase.dart';
import 'package:clean_architecture_example/src/domain/usecases/user_usecase.dart';
import 'package:clean_architecture_example/src/presentation/bloc/bloc/user_bloc.dart';
import 'package:clean_architecture_example/src/presentation/bloc/post/post_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/post_repository_impl.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector
    //* network
    ..registerLazySingleton<DioClient>(() => DioClient(Dio()))

    //* data sources
    ..registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<PostRemoteDateSource>(() => PostRemoteDateSourceImpl(injector()))

    //* repositories
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(injector()))
    ..registerLazySingleton<PostRepository>(() => PostRepositoryImpl(injector()))

    //* usecases
    ..registerLazySingleton<UserUsecase>(() => UserUsecase(injector()))
    ..registerLazySingleton<PostUsecase>(() => PostUsecase(injector()))

    //* blocs
    ..registerFactory(() => PostBloc(injector()))
    ..registerFactory(() => UserBloc(injector()));
}
