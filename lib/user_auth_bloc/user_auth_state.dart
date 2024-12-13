// auth_state.dart
import 'package:equatable/equatable.dart';

enum AuthStatus { authenticated, unAuthenticated, unKnown }

class UserAuthState extends Equatable {
  final AuthStatus userAuthStatus;

  const UserAuthState({this.userAuthStatus = AuthStatus.unKnown});

  @override
  List<Object> get props => [userAuthStatus];

  UserAuthState copyWith({AuthStatus? userAuthStatus}) {
    return UserAuthState(
      userAuthStatus: userAuthStatus ?? this.userAuthStatus,
    );
  }
}
