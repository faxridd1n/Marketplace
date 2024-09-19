part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class GetCategoriesEvent extends CategoryEvent {
  GetCategoriesEvent();
}

class GetCategoryEvent extends CategoryEvent {
  final int categoryId;
  final int size;
  GetCategoryEvent(this.categoryId,this.size);
}

// ignore: must_be_immutable
class PostBasketProductCategoryEvent extends CategoryEvent {
  final String productVariationId;
  int? count;
  PostBasketProductCategoryEvent({required this.productVariationId, this.count});
}
