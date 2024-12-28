part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetTabsEvent extends HomeEvent {
  GetTabsEvent();
}

class GetOrganizationsEvent extends HomeEvent {
  GetOrganizationsEvent();
}

// ignore: must_be_immutable
class PostBasketProductHomeEvent extends HomeEvent {
  final int count;
  final String productVariationId;
  PostBasketProductHomeEvent(
      {required this.productVariationId, required this.count});
}

class GetProductEvent extends HomeEvent {
  final int tab;
  GetProductEvent(this.tab);
}
