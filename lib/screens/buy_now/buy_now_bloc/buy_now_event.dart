part of 'buy_now_bloc.dart';

@immutable
abstract class BuyNowEvent {}

class GetRegionsEvent extends BuyNowEvent {
  GetRegionsEvent();
}

class GetDistrictsEvent extends BuyNowEvent {
  final int regionId;
  GetDistrictsEvent(this.regionId);
}

class PostUsersOrderEvent extends BuyNowEvent {
  final PostOrderRequestModel postOrderRequestModel;
  PostUsersOrderEvent({required this.postOrderRequestModel});
}
