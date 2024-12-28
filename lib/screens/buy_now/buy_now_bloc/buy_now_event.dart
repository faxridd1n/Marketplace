part of 'buy_now_bloc.dart';

@immutable
abstract class BuyNowEvent {}

class GetBasketProductsEvent extends BuyNowEvent {
  GetBasketProductsEvent();
}

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

class GetOrganizationEvent extends BuyNowEvent {
  final int organizationId;
  GetOrganizationEvent({required this.organizationId});
}