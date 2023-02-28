

part of 'infopage_bloc.dart';

@immutable
abstract class NewUserEvent {}

class SendData extends NewUserEvent {
  final String name;
  final String job;

  SendData(this.name, this.job);
}
