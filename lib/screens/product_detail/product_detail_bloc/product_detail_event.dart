part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent {}

class GetProductDetailEvent extends ProductDetailEvent {
  final String productId;
  GetProductDetailEvent(this.productId);
}

class GetProductsReviewEvent extends ProductDetailEvent {
  final String forId;
  GetProductsReviewEvent({required this.forId});
}

class PostProductsReviewEvent extends ProductDetailEvent {
  final PostReviewRequestModel postReviewRequestModel;
  final String forId;
  PostProductsReviewEvent(
      {required this.postReviewRequestModel, required this.forId});
}

class GetSimilarProductsEvent extends ProductDetailEvent {
  final int sectionId;

  GetSimilarProductsEvent({required this.sectionId});
}

class PostBasketProductDetailEvent extends ProductDetailEvent {
  final String productVariationId;
  final int? count;
  PostBasketProductDetailEvent({required this.productVariationId, this.count});
}

class GetOrganizationContactEvent extends ProductDetailEvent {
  final int organizationId;

  GetOrganizationContactEvent({required this.organizationId});
}
