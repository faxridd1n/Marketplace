part of 'section_products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {
  final int size;
  final int page;
  GetProductsEvent(this.size, this.page);
}

class GetFilteredProductsEvent extends ProductsEvent {
  final String? sectionId;
  final String? categoryId;
  final int page;
  final int size;
  GetFilteredProductsEvent(
      this.sectionId, this.categoryId, this.page, this.size);
}

class GetSimilarProductsEvent extends ProductsEvent {
  final int categoryId;
  final int size;
  GetSimilarProductsEvent(this.categoryId, this.size);
}

class SetSectionIdEvent extends ProductsEvent {
  final String sectionId;
  final int size;
  final int page;
  SetSectionIdEvent(this.sectionId, this.page, this.size);
}

class SetCategoryIdEvent extends ProductsEvent {
  final int categoryId;
  final int size;
  SetCategoryIdEvent(this.categoryId, this.size);
}

class GetSearchFiltersEvent extends ProductsEvent {
  final String? sectionId;
  final String? categoryId;
  GetSearchFiltersEvent(this.sectionId, this.categoryId);
}

class PostBasketProductSeeAllEvent extends ProductsEvent {
  final String productVariationId;
  final int? count;
  PostBasketProductSeeAllEvent({required this.productVariationId, this.count});
}
