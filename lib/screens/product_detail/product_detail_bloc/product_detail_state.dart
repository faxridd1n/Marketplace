part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  final ProductDetailModel productDetailModel;
  final FormzSubmissionStatus getDetailStatus;
  final GeneralResponseModel postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;
  final List<ProductModel>? parentCategoryModel;
  final FormzSubmissionStatus getProductStatus;
  final OrganizationContactModel? organizationContactModel;
  final FormzSubmissionStatus organizationContactStatus;
  final ProductsGetReviewResponseModel productsGetReviewResponseModel;
  final FormzSubmissionStatus getProductsReviewResponseStatus;
  final GeneralResponseModel postReviewResponseModel;
  final FormzSubmissionStatus postReviewResponseStatus;

  const ProductDetailState({
    this.productDetailModel = const ProductDetailModel(),
    this.getDetailStatus = FormzSubmissionStatus.initial,
    this.postResponseBasketModel = const GeneralResponseModel(),
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
    this.parentCategoryModel,
    this.getProductStatus = FormzSubmissionStatus.initial,
    this.organizationContactModel,
    this.organizationContactStatus = FormzSubmissionStatus.initial,
    this.productsGetReviewResponseModel =
        const ProductsGetReviewResponseModel(),
    this.getProductsReviewResponseStatus = FormzSubmissionStatus.initial,
    this.postReviewResponseModel = const GeneralResponseModel(),
    this.postReviewResponseStatus = FormzSubmissionStatus.initial,
  });

  ProductDetailState copyWith({
    ProductDetailModel? productDetailModel,
    FormzSubmissionStatus? getDetailStatus,
    GeneralResponseModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
    List<ProductModel>? parentCategoryModel,
    FormzSubmissionStatus? getProductStatus,
    OrganizationContactModel? organizationContactModel,
    FormzSubmissionStatus? organizationContactStatus,
    ProductsGetReviewResponseModel? productsGetReviewResponseModel,
    FormzSubmissionStatus? getProductsReviewResponseStatus,
    GeneralResponseModel? postReviewResponseModel,
    FormzSubmissionStatus? postReviewResponseStatus,
  }) {
    return ProductDetailState(
      productDetailModel: productDetailModel ?? this.productDetailModel,
      getDetailStatus: getDetailStatus ?? this.getDetailStatus,
      postResponseBasketModel:
          postResponseBasketModel ?? this.postResponseBasketModel,
      postResponseBasketStatus:
          postResponseBasketStatus ?? this.postResponseBasketStatus,
      parentCategoryModel: parentCategoryModel ?? this.parentCategoryModel,
      getProductStatus: getProductStatus ?? this.getProductStatus,
      organizationContactModel:
          organizationContactModel ?? this.organizationContactModel,
      organizationContactStatus:
          organizationContactStatus ?? this.organizationContactStatus,
      productsGetReviewResponseModel:
          productsGetReviewResponseModel ?? this.productsGetReviewResponseModel,
      getProductsReviewResponseStatus: getProductsReviewResponseStatus ??
          this.getProductsReviewResponseStatus,

           postReviewResponseModel:
          postReviewResponseModel ?? this.postReviewResponseModel,
      postReviewResponseStatus: postReviewResponseStatus ??
          this.postReviewResponseStatus,
    );
  }

  @override
  List<Object?> get props => [
        productDetailModel,
        getDetailStatus,
        postResponseBasketModel,
        postResponseBasketStatus,
        parentCategoryModel,
        getProductStatus,
        organizationContactModel,
        organizationContactStatus,
        productsGetReviewResponseModel,
        getProductsReviewResponseStatus,
        postReviewResponseModel,
        postReviewResponseStatus,
      ];
}
