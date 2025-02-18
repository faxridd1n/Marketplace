part of 'buy_now_bloc.dart';

@immutable
abstract class BuyNowEvent {}

class GetBasketProductsEvent extends BuyNowEvent {
  GetBasketProductsEvent();
}

class GetUserProfileEvent extends BuyNowEvent {
  GetUserProfileEvent();
}

class GetRegionsEvent extends BuyNowEvent {
  GetRegionsEvent();
}

class GetDistrictsEvent extends BuyNowEvent {
  final int regionId;
  GetDistrictsEvent(this.regionId);
}

class GetOrganizationEvent extends BuyNowEvent {
  final int organizationId;
  GetOrganizationEvent({required this.organizationId});
}

class SelectPaymentTypeEvent extends BuyNowEvent {
  final int paymentType;
  SelectPaymentTypeEvent({
    required this.paymentType,
  });
}

class SelectDeliveryTypeEvent extends BuyNowEvent {
  final int deliveryType;
  SelectDeliveryTypeEvent({
    required this.deliveryType,
  });
}

class SelectRegionEvent extends BuyNowEvent {
  final int regionId;
  SelectRegionEvent({
    required this.regionId,
  });
}

class SelectDistrictEvent extends BuyNowEvent {
  final int districtId;
  SelectDistrictEvent({
    required this.districtId,
  });
}

class FillAddressEvent extends BuyNowEvent {
  final String address;
  FillAddressEvent({
    required this.address,
  });
}

class GetVariationEvent extends BuyNowEvent {
  final List<Items> items;
  GetVariationEvent({
    required this.items,
  });
}

class GetUserInfoEvent extends BuyNowEvent {
  final String fullName;
  final String phone;
  GetUserInfoEvent({
    required this.fullName,
    required this.phone,
  });
}

class FillCommentEvent extends BuyNowEvent {
  final String comment;
  FillCommentEvent({
    required this.comment,
  });
}

class PostUsersOrderEvent extends BuyNowEvent {
  final PostOrderRequestModel orderRequestModel;
  PostUsersOrderEvent({
    required this.orderRequestModel,
  });
}
