// auth_event.dart
import 'package:equatable/equatable.dart';

abstract class UserAuthEvent extends Equatable {
  const UserAuthEvent();

  @override
  List<Object> get props => [];
}

class AuthAppStarted extends UserAuthEvent {}

class AuthLoginRequested extends UserAuthEvent {}

class AuthLogoutRequested extends UserAuthEvent {}

class AuthStatusChecked extends UserAuthEvent {}
