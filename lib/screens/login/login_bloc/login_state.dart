part of 'login_bloc.dart';

class LoginState extends Equatable {
  final LoginModel? loginModel;
  final FormzSubmissionStatus postLoginUserStatus;

  const LoginState({
    this.loginModel,
    this.postLoginUserStatus = FormzSubmissionStatus.initial,
  });

  LoginState copyWith({
    LoginModel? loginModel,
    FormzSubmissionStatus? postLoginUserStatus,
  }) {
    return LoginState(
      loginModel: loginModel ?? this.loginModel,
      postLoginUserStatus: postLoginUserStatus ?? this.postLoginUserStatus,
    );
  }

  @override
  List<Object?> get props => [
        loginModel,
        postLoginUserStatus,
      ];
}
