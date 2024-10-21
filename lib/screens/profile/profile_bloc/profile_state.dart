part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserProfileModel? userProfileModel;
  final FormzSubmissionStatus getUserProfileStatus;

  const ProfileState({
    this.userProfileModel,
    this.getUserProfileStatus = FormzSubmissionStatus.initial,
  });

  ProfileState copyWith({
    UserProfileModel? userProfileModel,
    FormzSubmissionStatus? getUserProfileStatus,
  }) {
    return ProfileState(
      userProfileModel: userProfileModel ?? this.userProfileModel,
      getUserProfileStatus: getUserProfileStatus ?? this.getUserProfileStatus,
    );
  }

  @override
  List<Object?> get props => [
        userProfileModel,
        getUserProfileStatus,
      ];
}
