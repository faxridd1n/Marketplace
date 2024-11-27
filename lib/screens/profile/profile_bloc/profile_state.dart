part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserProfileModel? userProfileModel;
  final FormzSubmissionStatus getUserProfileStatus;

  final UserOrdersModel? userOrdersModel;
  final FormzSubmissionStatus getUserOrdersStatus;
  final FormzSubmissionStatus editUserInfoStatus;

  const ProfileState(
      {this.userProfileModel,
      this.getUserProfileStatus = FormzSubmissionStatus.initial,
      this.userOrdersModel,
      this.getUserOrdersStatus = FormzSubmissionStatus.initial,
      this.editUserInfoStatus = FormzSubmissionStatus.initial});

  ProfileState copyWith(
      {UserProfileModel? userProfileModel,
      FormzSubmissionStatus? getUserProfileStatus,
      UserOrdersModel? userOrdersModel,
      FormzSubmissionStatus? getUserOrdersStatus,
      FormzSubmissionStatus? editUserInfoStatus}) {
    return ProfileState(
      userProfileModel: userProfileModel ?? this.userProfileModel,
      getUserProfileStatus: getUserProfileStatus ?? this.getUserProfileStatus,
      userOrdersModel: userOrdersModel ?? this.userOrdersModel,
      getUserOrdersStatus: getUserOrdersStatus ?? this.getUserOrdersStatus,
      editUserInfoStatus: editUserInfoStatus ?? this.editUserInfoStatus,
    );
  }

  @override
  List<Object?> get props => [
        userProfileModel,
        getUserProfileStatus,
        userOrdersModel,
        getUserOrdersStatus,
        editUserInfoStatus,
      ];
}
