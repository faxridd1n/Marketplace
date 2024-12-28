// auth_state.dart
import 'package:equatable/equatable.dart';

enum AuthStatus { authenticated, unAuthenticated, unKnown }

class AuthenticationState extends Equatable {
  final AuthStatus userAuthStatus;

  const AuthenticationState({this.userAuthStatus = AuthStatus.unKnown});

  AuthenticationState copyWith({
    AuthStatus? userAuthStatus,
  }) {
    return AuthenticationState(
      userAuthStatus: userAuthStatus ?? this.userAuthStatus,
    );
  }

  @override
  List<Object> get props => [userAuthStatus];
}
