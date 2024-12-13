// auth_bloc.dart
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_auth_event.dart';
import 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  UserAuthBloc() : super(const UserAuthState()) {
    on<AuthAppStarted>((event, emit) async {
      // Check if token exists in secure storage

      if (userTokenBox.isNotEmpty &&
          userTokenBox.get('token')!.token.isNotEmpty) {
        emit(state.copyWith(userAuthStatus: AuthStatus.authenticated));
      } else {
        emit(state.copyWith(userAuthStatus: AuthStatus.unAuthenticated));
      }
    });
    on<AuthLoginRequested>((event, emit) {
      // Handle login logic here (e.g., API call, local auth check)
      emit(state.copyWith(userAuthStatus: AuthStatus.authenticated));
    });

    on<AuthLogoutRequested>((event, emit) {
      // Handle logout logic here (e.g., clear tokens)
      emit(state.copyWith(userAuthStatus: AuthStatus.unAuthenticated));
    });

    on<AuthStatusChecked>((event, emit) {
      // Optionally determine current auth status (e.g., check token validity)
      // For demo purposes, emitting unKnown directly.
      emit(state.copyWith(userAuthStatus: AuthStatus.unKnown));
    });
  }
}
