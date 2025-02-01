part of 'user_cards_bloc.dart';

class UserCardsState extends Equatable {
  final GetUserCardsResponseModel getUserCardsResponseModel;
  final FormzSubmissionStatus getUserCardsResponseStatus;

  final PostUserCardResponseModel postUserCardResponseModel;
  final FormzSubmissionStatus postUserCardResponseStatus;

  final PostUserAddCardConfirmResponseModel postUserAddCardConfirmResponseModel;
  final FormzSubmissionStatus postUserAddCardConfirmResponsStatus;

  final GeneralResponseModel putUserMainCardResponseModel;
  final FormzSubmissionStatus putUserMainCardResponseStatus;
  final GeneralResponseModel deleteUserCardResponseModel;
  final FormzSubmissionStatus deleteUserCardResponseStatus;

  const UserCardsState({
    this.getUserCardsResponseModel = const GetUserCardsResponseModel(),
    this.getUserCardsResponseStatus = FormzSubmissionStatus.initial,
    this.postUserCardResponseModel = const PostUserCardResponseModel(),
    this.postUserCardResponseStatus = FormzSubmissionStatus.initial,
    this.postUserAddCardConfirmResponseModel =
        const PostUserAddCardConfirmResponseModel(),
    this.postUserAddCardConfirmResponsStatus = FormzSubmissionStatus.initial,
    this.putUserMainCardResponseModel = const GeneralResponseModel(),
    this.putUserMainCardResponseStatus = FormzSubmissionStatus.initial,
    this.deleteUserCardResponseModel = const GeneralResponseModel(),
    this.deleteUserCardResponseStatus = FormzSubmissionStatus.initial,
  });

  UserCardsState copyWith({
    GetUserCardsResponseModel? getUserCardsResponseModel,
    FormzSubmissionStatus? getUserCardsResponseStatus,
    PostUserCardResponseModel? postUserCardResponseModel,
    FormzSubmissionStatus? postUserCardResponseStatus,
    PostUserAddCardConfirmResponseModel? postUserAddCardConfirmResponseModel,
    FormzSubmissionStatus? postUserAddCardConfirmResponsStatus,
    GeneralResponseModel? putUserMainCardResponseModel,
    FormzSubmissionStatus? putUserMainCardResponseStatus,
    GeneralResponseModel? deleteUserCardResponseModel,
    FormzSubmissionStatus? deleteUserCardResponseStatus,
  }) {
    return UserCardsState(
      getUserCardsResponseModel:
          getUserCardsResponseModel ?? this.getUserCardsResponseModel,
      getUserCardsResponseStatus:
          getUserCardsResponseStatus ?? this.getUserCardsResponseStatus,
      postUserCardResponseModel:
          postUserCardResponseModel ?? this.postUserCardResponseModel,
      postUserCardResponseStatus:
          postUserCardResponseStatus ?? this.postUserCardResponseStatus,
      postUserAddCardConfirmResponseModel:
          postUserAddCardConfirmResponseModel ??
              this.postUserAddCardConfirmResponseModel,
      postUserAddCardConfirmResponsStatus:
          postUserAddCardConfirmResponsStatus ??
              this.postUserAddCardConfirmResponsStatus,
      putUserMainCardResponseModel:
          putUserMainCardResponseModel ?? this.putUserMainCardResponseModel,
      putUserMainCardResponseStatus:
          putUserMainCardResponseStatus ?? this.putUserMainCardResponseStatus,
      deleteUserCardResponseModel:
          deleteUserCardResponseModel ?? this.deleteUserCardResponseModel,
      deleteUserCardResponseStatus:
          deleteUserCardResponseStatus ?? this.deleteUserCardResponseStatus,
    );
  }

  @override
  List<Object?> get props => [
        getUserCardsResponseModel,
        getUserCardsResponseStatus,
        postUserCardResponseModel,
        postUserCardResponseStatus,
        postUserAddCardConfirmResponseModel,
        postUserAddCardConfirmResponsStatus,
        putUserMainCardResponseModel,
        putUserMainCardResponseStatus,
        deleteUserCardResponseModel,
        deleteUserCardResponseStatus
      ];
}
