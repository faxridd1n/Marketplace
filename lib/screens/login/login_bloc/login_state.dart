part of 'login_bloc.dart';

class LoginState extends Equatable {
  final PostLoginResponseModel? postloginResponseModel;
  final FormzSubmissionStatus postLoginUserResponseStatus;
  final PutLoginOtpResponseModel? putLoginOtpResponseModel;
  final FormzSubmissionStatus putLoginResponseStatus;

  const LoginState({
    this.postloginResponseModel,
    this.postLoginUserResponseStatus = FormzSubmissionStatus.initial,
    this.putLoginOtpResponseModel,
    this.putLoginResponseStatus = FormzSubmissionStatus.initial,
  });

  LoginState copyWith({
    PostLoginResponseModel? postloginResponseModel,
    FormzSubmissionStatus? postLoginUserResponseStatus,
    PutLoginOtpResponseModel? putLoginOtpResponseModel,
    FormzSubmissionStatus? putLoginResponseStatus,
  }) {
    return LoginState(
        postloginResponseModel:
            postloginResponseModel ?? this.postloginResponseModel,
        postLoginUserResponseStatus:
            postLoginUserResponseStatus ?? this.postLoginUserResponseStatus,
        putLoginOtpResponseModel:
            putLoginOtpResponseModel ?? this.putLoginOtpResponseModel,
        putLoginResponseStatus:
            putLoginResponseStatus ?? this.putLoginResponseStatus);
  }

  @override
  List<Object?> get props => [
        postloginResponseModel,
        postLoginUserResponseStatus,
        putLoginOtpResponseModel,
        putLoginResponseStatus,
      ];
}
