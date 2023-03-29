import 'package:bloc/bloc.dart';
import 'package:clean_architecture_example/src/domain/entities/post/post.dart';
import 'package:clean_architecture_example/src/domain/usecases/post_usecase.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostUsecase _usecase;
  PostBloc(this._usecase) : super(PostInitial()) {
    on<GetAllPosts>(
      (event, emit) async {
        try {
          final result = await _usecase.getAllPosts();
          result.fold(
            (failure) {
              emit(PostError(message: failure.message));
              return;
            },
            (data) => emit(PostHasData(data: data)),
          );
        } on Exception catch (_) {
          emit(PostError(message: 'Something went wrong'));
          return;
        }
      },
    );
    on<FilterPosts>((event, emit) async {
      try {
        final result = await _usecase.getAllPosts();
        result.fold(
          (failure) {
            emit(FilterPostsError(message: failure.message));
          },
          (data) {
            emit(FilterPostsHasData(data: data));
          },
        );
      } on Exception catch (_) {
        emit(FilterPostsError(message: 'Something went wrong'));
      }
    });
  }
}
