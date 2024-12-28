part of 'section_products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {
  GetProductsEvent();
}

class SetSectionIdEvent extends ProductsEvent {
  final int sectionId;
  SetSectionIdEvent(this.sectionId);
}

class SetCategoryIdEvent extends ProductsEvent {
  final int categoryId;
  SetCategoryIdEvent(this.categoryId);
}
