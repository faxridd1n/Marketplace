part of 'buy_now_bloc.dart';

@immutable
abstract class BuyNowEvent {}

class GetRegionsEvent extends BuyNowEvent {
  GetRegionsEvent();
}
// ignore: must_be_immutable
class GetDistrictsEvent extends BuyNowEvent {
  int regionId;
  GetDistrictsEvent(this.regionId);
}

