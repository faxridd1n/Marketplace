part of 'category_products_bloc.dart';

@immutable
abstract class CategoryProductsEvent {}

class GetCategoryProductsEvent extends CategoryProductsEvent {
  final int categoryId;
  final int size;
  final int page;
  GetCategoryProductsEvent(this.categoryId, this.size, this.page);
}

class PostBasketProductCategoryProductsEvent extends CategoryProductsEvent {
  final String productVariationId;
  final int? count;
  PostBasketProductCategoryProductsEvent(
      {required this.productVariationId, this.count});
}
