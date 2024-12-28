// auth_event.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_state.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthStatus status;

  const AuthenticationStatusChanged( this.status);
}

