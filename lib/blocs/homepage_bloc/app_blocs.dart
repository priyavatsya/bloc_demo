import 'package:bloc_demo/blocs/homepage_bloc/app_events.dart';
import 'package:bloc_demo/blocs/homepage_bloc/app_states.dart';
import 'package:bloc_demo/repo/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await userRepository.getUsers();
        emit(UserLoadedState(users!));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
