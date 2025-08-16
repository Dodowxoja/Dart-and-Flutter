import 'package:bloc_dio_get_it/features/users/domain/model/user_model.dart';
import 'package:bloc_dio_get_it/features/users/domain/repository/users_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository usersRepository;

  UsersBloc(this.usersRepository) : super(UsersState.initial()) {
    on<GetUsersEvent>((event, emit) async {
      emit(state.copyWith(status: UsersStatus.loading));
      try {
        var result = await usersRepository.getUsers();
        emit(state.copyWith(status: UsersStatus.success, users: result));
      } catch (e) {
        emit(
          state.copyWith(status: UsersStatus.error, errorMessage: e.toString()),
        );
      }
    });
  }
}
