import 'package:bloc/bloc.dart';
import 'package:clean_architecture_example/src/domain/usecases/user_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUsecase _usecase;

  UserBloc(this._usecase) : super(UserInitial()) {
    on<GetAllUsers>((event, emit) async {
      try {
        final result = await _usecase.getAllUsers();

        result.fold((failure) {
          emit(UserError(message: failure.message));
          return;
        }, (data) {
          emit(UserHasData(data: data));

          return;
        });
      } on Exception catch (_) {
        emit(UserError(message: 'Something went wrong'));
        return;
      }
    });
  }
}
