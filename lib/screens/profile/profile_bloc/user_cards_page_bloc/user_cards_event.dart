part of 'user_cards_bloc.dart';

@immutable
abstract class UserCardsEvent {}

class GetUserCardsResponseEvent extends UserCardsEvent {
  GetUserCardsResponseEvent();
}

class PostUserCardResponseEvent extends UserCardsEvent {
  final PostUserAddCardRequestModel postUserAddCardRequestModel;
  PostUserCardResponseEvent({
    required this.postUserAddCardRequestModel,
  });
}

class PostUserAddCardConfirmResponseEvent extends UserCardsEvent {
  final String otp;
  final int session;

  PostUserAddCardConfirmResponseEvent({
    required this.otp,
    required this.session,
  });
}

class PutUserMainCardEvent extends UserCardsEvent {
  final int cardId;
  PutUserMainCardEvent({required this.cardId});
}
class DeleteUserCardEvent extends UserCardsEvent {
  final int cardId;
  DeleteUserCardEvent({required this.cardId});
}