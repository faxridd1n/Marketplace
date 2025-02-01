import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_auth_event.dart';
import 'user_auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<AuthenticationStatusChanged>((event, emit) {
      emit(state.copyWith(userAuthStatus: event.status));
    });
    final isTokenExist =
        userTokenBox.isNotEmpty && userTokenBox.get('token')!.token.isNotEmpty;
    if (isTokenExist) {
      add(const AuthenticationStatusChanged(AuthStatus.authenticated));
    } else {
      add(const AuthenticationStatusChanged(AuthStatus.unAuthenticated));
    }
  }
}
