part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent {}

class GetProductDetailEvent extends ProductDetailEvent {
  final String productId;

  GetProductDetailEvent(this.productId);
}

class GetSimilarProductsEvent extends ProductDetailEvent {
  final int categoryId;

  GetSimilarProductsEvent(this.categoryId);
}
