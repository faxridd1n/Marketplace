part of 'organization_bloc.dart';

class OrganizationState extends Equatable {
  final List<ProductModel>? productModel;
  final FormzSubmissionStatus getProductStatus;
  final bool hasMoreProducts;
  final String next;
  final GeneralResponseModel postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;
  // final bool? hasMore;
  // final int? size;
  // final int? categoryId;

  const OrganizationState({
    this.productModel,
    this.getProductStatus = FormzSubmissionStatus.initial,
    this.hasMoreProducts = true,
    this.next = '',
    this.postResponseBasketModel=const GeneralResponseModel(),
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,

    // this.hasMore=true,
    // this.size=10,
    // this.categoryId,
  });

  OrganizationState copyWith({
    List<ProductModel>? productModel,
    FormzSubmissionStatus? getProductStatus,
   
    bool? hasMoreProducts,
    String? next,
    GeneralResponseModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
    // bool? hasMore,
    // int? size,
    // int? categoryId,
  }) {
    return OrganizationState(
      productModel: productModel ?? this.productModel,
      getProductStatus: getProductStatus ?? this.getProductStatus,
      postResponseBasketModel: postResponseBasketModel ?? this.postResponseBasketModel,
      postResponseBasketStatus: postResponseBasketStatus ?? this.postResponseBasketStatus,
      hasMoreProducts: hasMoreProducts ?? this.hasMoreProducts,
      next: next ?? this.next,
      // hasMore: hasMore ?? this.hasMore,
      // size: size ?? this.size,
      // categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  List<Object?> get props => [
        productModel,
        getProductStatus,
        postResponseBasketModel,
        postResponseBasketStatus,
        hasMoreProducts,
        next,
        // // items,
        // hasMore,
        // size,
        // categoryId,
      ];
}
