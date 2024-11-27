part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final RegisterUserRequestModel registerUserRequestModel;
  RegisterUserEvent({required this.registerUserRequestModel});
}

class RegisterConfirmRequestEvent extends AuthEvent {
  final RegisterConfirmRequestModel confirmRequestModel;
  RegisterConfirmRequestEvent({required this.confirmRequestModel});
}
