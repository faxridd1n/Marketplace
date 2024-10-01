part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final AuthModel? userModel;
  final FormzSubmissionStatus postAuthUserStatus;

  const ProfileState({
    this.userModel,
    this.postAuthUserStatus = FormzSubmissionStatus.initial,
  });

  ProfileState copyWith({
    AuthModel? userModel,
    FormzSubmissionStatus? postAuthUserStatus,
  }) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
      postAuthUserStatus: postAuthUserStatus ?? this.postAuthUserStatus,
    );
  }

  @override
  List<Object?> get props => [
        userModel,
        postAuthUserStatus,
      ];
}
