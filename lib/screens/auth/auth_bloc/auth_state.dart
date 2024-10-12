part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final RegisterUserResponseModel? registerUserResponseModel;
  final FormzSubmissionStatus registerUserResponseStatus;

  // final RegisterConfirmRequestModel? registerConfirmRequestModel;
  // final FormzSubmissionStatus registerConfirmRequestStatus;
  final RegisterConfirmResponseModel? registerConfirmResponseModel;
  final FormzSubmissionStatus registerConfirmResponseStatus;
  const AuthState({
    this.registerUserResponseModel,
    this.registerUserResponseStatus = FormzSubmissionStatus.initial,
    // this.registerConfirmRequestModel,
    // this.registerConfirmRequestStatus = FormzSubmissionStatus.initial,this.registerConfirmResponseModel,
    this.registerConfirmResponseModel,
    this.registerConfirmResponseStatus = FormzSubmissionStatus.initial,
  });

  AuthState copyWith({
    RegisterUserResponseModel? registerUserResponseModel,
    FormzSubmissionStatus? registerUserResponseStatus,
    // RegisterConfirmRequestModel? registerConfirmRequestModel,
    // FormzSubmissionStatus? registerConfirmRequestStatus,

    RegisterConfirmResponseModel? registerConfirmResponseModel,
    FormzSubmissionStatus? registerConfirmResponseStatus,
  }) {
    return AuthState(
      registerUserResponseModel:
          registerUserResponseModel ?? this.registerUserResponseModel,
      registerUserResponseStatus:
          registerUserResponseStatus ?? this.registerUserResponseStatus,
      // registerConfirmRequestModel:
      //     registerConfirmRequestModel ?? this.registerConfirmRequestModel,
      // registerConfirmRequestStatus:
      //     registerConfirmRequestStatus ?? this.registerConfirmRequestStatus,

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
        // registerConfirmRequestModel,
        // registerConfirmRequestStatus,

        registerConfirmResponseModel,
        registerConfirmResponseStatus,
      ];
}
