part of 'see_all_bloc.dart';

class SeeAllState extends Equatable {
  final List<ProductModel>? productModel;
  final FormzSubmissionStatus getProductStatus;
  final bool hasMoreProducts;
  final String next;
  final List<FilteredSearchModel>? filteredProductModel;
  final FormzSubmissionStatus getFilteredProductStatus;
  final PostResponseBasketModel? postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;
  // final bool? hasMore;
  // final int? size;
  // final int? categoryId;

  const SeeAllState({
    this.productModel,
    this.getProductStatus = FormzSubmissionStatus.initial,
    this.hasMoreProducts = true,
    this.next = '',
    this.filteredProductModel,
    this.getFilteredProductStatus = FormzSubmissionStatus.initial,
    this.postResponseBasketModel,
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,

    // this.hasMore=true,
    // this.size=10,
    // this.categoryId,
  });

  SeeAllState copyWith({
    List<ProductModel>? productModel,
    FormzSubmissionStatus? getProductStatus,
    List<FilteredSearchModel>? filteredProductModel,
    FormzSubmissionStatus? getFilteredProductStatus,
    bool? hasMoreProducts,
    String? next,
    PostResponseBasketModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
    // bool? hasMore,
    // int? size,
    // int? categoryId,
  }) {
    return SeeAllState(
      productModel: productModel ?? this.productModel,
      getProductStatus: getProductStatus ?? this.getProductStatus,
      filteredProductModel: filteredProductModel ?? this.filteredProductModel,
      getFilteredProductStatus: getFilteredProductStatus ?? this.getFilteredProductStatus,
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
        filteredProductModel,
        getFilteredProductStatus,
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
