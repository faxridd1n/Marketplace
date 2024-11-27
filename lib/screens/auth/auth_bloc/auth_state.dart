part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final RegisterUserResponseModel? registerUserResponseModel;
  final FormzSubmissionStatus registerUserResponseStatus;
  final RegisterConfirmResponseModel? registerConfirmResponseModel;
  final FormzSubmissionStatus registerConfirmResponseStatus;
  const AuthState({
    this.registerUserResponseModel,
    this.registerUserResponseStatus = FormzSubmissionStatus.initial,
    this.registerConfirmResponseModel,
    this.registerConfirmResponseStatus = FormzSubmissionStatus.initial,
  });

  AuthState copyWith({
    RegisterUserResponseModel? registerUserResponseModel,
    FormzSubmissionStatus? registerUserResponseStatus,
    RegisterConfirmResponseModel? registerConfirmResponseModel,
    FormzSubmissionStatus? registerConfirmResponseStatus,
  }) {
    return AuthState(
      registerUserResponseModel:
          registerUserResponseModel ?? this.registerUserResponseModel,
      registerUserResponseStatus:
          registerUserResponseStatus ?? this.registerUserResponseStatus,
      registerConfirmResponseModel:
          registerConfirmResponseModel ?? this.registerConfirmResponseModel,
      registerConfirmResponseStatus:
          registerConfirmResponseStatus ?? this.registerConfirmResponseStatus,
    );
  }

  @override
  List<Object?> get props => [
        registerUserResponseModel,
        registerUserResponseStatus,
        registerConfirmResponseModel,
        registerConfirmResponseStatus,
      ];
}
