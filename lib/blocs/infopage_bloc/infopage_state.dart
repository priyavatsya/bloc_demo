import '../../model/infopage_model.dart';

//@immutable
class NewUserState {}

class NewUserInitial extends NewUserState {}

class NewUserLoading extends NewUserState {}

class NewUserLoaded extends NewUserState {
  final InfoPageModel data;

  NewUserLoaded(this.data);
}

class NewUserError extends NewUserState {}