part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserProfileModel? userProfileModel;
  final FormzSubmissionStatus getUserProfileStatus;

  final UserOrdersModel? userOrdersModel;
  final FormzSubmissionStatus getUserOrdersStatus;

  final EdittedUserInfoResponseModel? edittedUserInfoResponseModel;
  final FormzSubmissionStatus editUserInfoStatus;

  const ProfileState({
    this.userProfileModel,
    this.getUserProfileStatus = FormzSubmissionStatus.initial,
    this.userOrdersModel,
    this.getUserOrdersStatus = FormzSubmissionStatus.initial,
    this.edittedUserInfoResponseModel,
    this.editUserInfoStatus = FormzSubmissionStatus.initial,
  });

  ProfileState copyWith({
    UserProfileModel? userProfileModel,
    FormzSubmissionStatus? getUserProfileStatus,
    UserOrdersModel? userOrdersModel,
    FormzSubmissionStatus? getUserOrdersStatus,
    EdittedUserInfoResponseModel? edittedUserInfoResponseModel,
    FormzSubmissionStatus? editUserInfoStatus,
  }) {
    return ProfileState(
      userProfileModel: userProfileModel ?? this.userProfileModel,
      getUserProfileStatus: getUserProfileStatus ?? this.getUserProfileStatus,
      userOrdersModel: userOrdersModel ?? this.userOrdersModel,
      getUserOrdersStatus: getUserOrdersStatus ?? this.getUserOrdersStatus,
      edittedUserInfoResponseModel:
          edittedUserInfoResponseModel ?? this.edittedUserInfoResponseModel,
      editUserInfoStatus: editUserInfoStatus ?? this.editUserInfoStatus,
    );
  }

  @override
  List<Object?> get props => [
        userProfileModel,
        getUserProfileStatus,
        userOrdersModel,
        getUserOrdersStatus,
        edittedUserInfoResponseModel,
        editUserInfoStatus,
      ];
}
