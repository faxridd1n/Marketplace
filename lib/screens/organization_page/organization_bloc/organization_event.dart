part of 'organization_bloc.dart';

@immutable
abstract class OrganizationEvent {}

class GetAllProductsEvent extends OrganizationEvent {
  final int categoryId;
  // final int size;
  GetAllProductsEvent(this.categoryId);
}

// ignore: must_be_immutable
class PostBasketProductSeeAllEvent extends OrganizationEvent {
  final String productVariationId;
  int? count;
  PostBasketProductSeeAllEvent({required this.productVariationId, this.count});
}

class FetchNextPage extends OrganizationEvent {
  final int categoryId;
  final int size;

  FetchNextPage(this.categoryId, this.size);
}
