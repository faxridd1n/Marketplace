part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class PostLoginUserEvent extends LoginEvent {
  final String phoneNumber;
  PostLoginUserEvent({required this.phoneNumber});
}

class PutLoginOtpEvent extends LoginEvent {
  final String phoneNumber;
  final String otp;
  PutLoginOtpEvent({required this.phoneNumber, required this.otp});
}
