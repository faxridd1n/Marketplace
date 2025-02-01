part of 'category_products_bloc.dart';

class CategoryProductsState extends Equatable {
  final List<ProductModel>? filteredProductModel;
  final FormzSubmissionStatus getFilteredProductStatus;
  final GeneralResponseModel postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;
  final bool? hasMore;
  final int? size;
  final int? categoryId;

  const CategoryProductsState({
    this.filteredProductModel,
    this.getFilteredProductStatus = FormzSubmissionStatus.initial,
    this.postResponseBasketModel=const GeneralResponseModel(),
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
    this.hasMore=true,
    this.size=10,
    this.categoryId,
  });

  CategoryProductsState copyWith({
    List<ProductModel>? filteredProductModel,
    FormzSubmissionStatus? getFilteredProductStatus,
    GeneralResponseModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
    bool? hasMore,
    int? size,
    int? categoryId,
  }) {
    return CategoryProductsState(
      filteredProductModel: filteredProductModel ?? this.filteredProductModel,
      getFilteredProductStatus:
          getFilteredProductStatus ?? this.getFilteredProductStatus,
      postResponseBasketModel:
          postResponseBasketModel ?? this.postResponseBasketModel,
      postResponseBasketStatus:
          postResponseBasketStatus ?? this.postResponseBasketStatus,
      hasMore: hasMore ?? this.hasMore,
      size: size ?? this.size,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  List<Object?> get props => [
        filteredProductModel,
        getFilteredProductStatus,
        postResponseBasketModel,
        postResponseBasketStatus,
        // items,
        hasMore,
        size,
        categoryId,
      ];
}
