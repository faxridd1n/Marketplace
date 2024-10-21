part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

// ignore: must_be_immutable
class PostLoginUserEvent extends LoginEvent {
  String phoneNumber;
  PostLoginUserEvent({required this.phoneNumber});
}
