part of 'see_all_bloc.dart';

@immutable
abstract class SeeAllEvent {}

class GetAllProductsEvent extends SeeAllEvent {
  final int categoryId;
  // final int size;
  GetAllProductsEvent(this.categoryId);
}

class GetSearchFiltersEvent extends SeeAllEvent {
  final int categoryId;
  // final int size;
  GetSearchFiltersEvent(this.categoryId);
}

// ignore: must_be_immutable
class PostBasketProductSeeAllEvent extends SeeAllEvent {
  final String productVariationId;
  int? count;
  PostBasketProductSeeAllEvent({required this.productVariationId, this.count});
}

class FetchNextPage extends SeeAllEvent {
  final int categoryId;
  final int size;

  FetchNextPage(this.categoryId, this.size);
}
