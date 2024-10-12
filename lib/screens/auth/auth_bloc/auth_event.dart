part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final RegisterUserModel userModel;
  RegisterUserEvent({required this.userModel});
}


class RegisterConfirmRequestEvent extends AuthEvent {
  final RegisterConfirmRequestModel userModel;
  RegisterConfirmRequestEvent({required this.userModel});
}