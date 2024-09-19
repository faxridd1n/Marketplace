part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetCategoriesEvent extends HomeEvent {
  GetCategoriesEvent();
}

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

class GetProduct1Event extends HomeEvent {
  final int tab;
  GetProduct1Event(this.tab);
}
