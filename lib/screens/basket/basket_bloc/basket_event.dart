part of 'basket_bloc.dart';

@immutable
abstract class BasketEvent {}

class GetBasketProductsEvent extends BasketEvent {
  GetBasketProductsEvent();
}

// ignore: must_be_immutable
class SelectBasketProductsEvent extends BasketEvent {
  BasketProductElement selectedProducts;
  SelectBasketProductsEvent({required this.selectedProducts});
}

class DeleteBasketProductsEvent extends BasketEvent {
  final String productVariationId;
  DeleteBasketProductsEvent(this.productVariationId);
}

class PostBasketProductBasketEvent extends BasketEvent {
  final String productVariationId;
  final int count;
  PostBasketProductBasketEvent(this.productVariationId, this.count);
}

// class AddItemEvent extends BasketEvent {
//   final BasketProductElement item;

//   AddItemEvent(this.item);
// }
