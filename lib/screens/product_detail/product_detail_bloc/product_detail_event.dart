part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent {}

class GetProductDetailEvent extends ProductDetailEvent {
  final String productId;

  GetProductDetailEvent(this.productId);
}

class GetSimilarProductsEvent extends ProductDetailEvent {
  final int categoryId;

  GetSimilarProductsEvent({required this.categoryId});
}

// ignore: must_be_immutable
class PostBasketProductDetailEvent extends ProductDetailEvent {
  final String productVariationId;
  int? count;
  PostBasketProductDetailEvent({required this.productVariationId, this.count});
}

class GetOrganizationContactEvent extends ProductDetailEvent {
  final int categoryId;

  GetOrganizationContactEvent({required this.categoryId});
}
