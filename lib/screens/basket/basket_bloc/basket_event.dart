part of 'basket_bloc.dart';

@immutable
abstract class BasketEvent {}

class GetBasketProductsEvent extends BasketEvent {
  GetBasketProductsEvent();
}

// ignore: must_be_immutable
class SelectBasketProductsEvent extends BasketEvent {
  ProductElement selectedProducts;
  SelectBasketProductsEvent({required this.selectedProducts});
}

class DeleteBasketProductsEvent extends BasketEvent {
  final String productVariationId;
  DeleteBasketProductsEvent(this.productVariationId);
}

class PostBasketProductCountBasketEvent extends BasketEvent {
  final String? productVariationId;
  final int? count;
  PostBasketProductCountBasketEvent(this.productVariationId, this.count);
}

class PostBasketProductBasketEvent extends BasketEvent {
  final int count;
  final String productVariationId;
  PostBasketProductBasketEvent(
      {required this.productVariationId, required this.count});
}

class GetOrganizationEvent extends BasketEvent {
  final int organizationId;
  GetOrganizationEvent({required this.organizationId});
}
// class AddItemEvent extends BasketEvent {
//   final BasketProductElement item;

//   AddItemEvent(this.item);
// }
