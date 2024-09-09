part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetProductEvent extends HomeEvent {

  GetProductEvent();

}

class GetCategoriesEvent extends HomeEvent {

  GetCategoriesEvent();

}
class GetOrganizationsEvent extends HomeEvent {

  GetOrganizationsEvent();
}


// ignore: must_be_immutable
class PostBasketProductHomeEvent extends HomeEvent {
 final int count;
final String productVariationId;
  PostBasketProductHomeEvent({required this.productVariationId,required this.count});

}
