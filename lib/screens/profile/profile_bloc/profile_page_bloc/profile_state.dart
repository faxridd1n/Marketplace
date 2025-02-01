part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserProfileModel userProfileModel;
  final FormzSubmissionStatus getUserProfileStatus;

  final UserOrdersModel userOrdersModel;
  final FormzSubmissionStatus getUserOrdersStatus;

  final UserOrdersModel userFinishedOrdersModel;
  final FormzSubmissionStatus getUserFinishedOrdersStatus;

  final EdittedUserInfoResponseModel edittedUserInfoResponseModel;
  final FormzSubmissionStatus editUserInfoStatus;

  const ProfileState({
    this.userProfileModel = const UserProfileModel(),
    this.getUserProfileStatus = FormzSubmissionStatus.initial,
    this.userOrdersModel = const UserOrdersModel(),
    this.getUserOrdersStatus = FormzSubmissionStatus.initial,
    this.edittedUserInfoResponseModel = const EdittedUserInfoResponseModel(),
    this.editUserInfoStatus = FormzSubmissionStatus.initial,
    this.userFinishedOrdersModel = const UserOrdersModel(),
    this.getUserFinishedOrdersStatus = FormzSubmissionStatus.initial,
  });

  ProfileState copyWith({
    UserProfileModel? userProfileModel,
    FormzSubmissionStatus? getUserProfileStatus,
    UserOrdersModel? userOrdersModel,
    FormzSubmissionStatus? getUserOrdersStatus,
    EdittedUserInfoResponseModel? edittedUserInfoResponseModel,
    FormzSubmissionStatus? editUserInfoStatus,
    UserOrdersModel? userFinishedOrdersModel,
    FormzSubmissionStatus? getUserFinishedOrdersStatus,
  }) {
    return ProfileState(
      userProfileModel: userProfileModel ?? this.userProfileModel,
      getUserProfileStatus: getUserProfileStatus ?? this.getUserProfileStatus,
      userOrdersModel: userOrdersModel ?? this.userOrdersModel,
      getUserOrdersStatus: getUserOrdersStatus ?? this.getUserOrdersStatus,
      edittedUserInfoResponseModel:
          edittedUserInfoResponseModel ?? this.edittedUserInfoResponseModel,
      editUserInfoStatus: editUserInfoStatus ?? this.editUserInfoStatus,
      userFinishedOrdersModel:
          userFinishedOrdersModel ?? this.userFinishedOrdersModel,
      getUserFinishedOrdersStatus:
          getUserFinishedOrdersStatus ?? this.getUserFinishedOrdersStatus,
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
        userFinishedOrdersModel,
        getUserFinishedOrdersStatus,
      ];
}
