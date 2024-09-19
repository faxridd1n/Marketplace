part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final List<ProductModel>? filteredProductModel;
  final FormzSubmissionStatus getFilteredProductStatus;
  final PostResponseBasketModel? postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;
  final bool? hasMore;
  final int? size;
  final int? categoryId;
  final CategoryModel? categoryModel;
  final FormzSubmissionStatus getCategoryStatus;

  const CategoryState({
    this.filteredProductModel,
    this.getFilteredProductStatus = FormzSubmissionStatus.initial,
    this.postResponseBasketModel,
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
    this.hasMore = true,
    this.size = 10,
    this.categoryId,
    this.categoryModel,
    this.getCategoryStatus = FormzSubmissionStatus.initial,
  });

  CategoryState copyWith({
    List<ProductModel>? filteredProductModel,
    FormzSubmissionStatus? getFilteredProductStatus,
    PostResponseBasketModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
    bool? hasMore,
    int? size,
    int? categoryId,
    CategoryModel? categoryModel,
    FormzSubmissionStatus? getCategoryStatus,
  }) {
    return CategoryState(
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
      categoryModel: categoryModel ?? this.categoryModel,
      getCategoryStatus: getCategoryStatus ?? this.getCategoryStatus,
    );
  }

  @override
  List<Object?> get props => [
        filteredProductModel,
        getFilteredProductStatus,
        postResponseBasketModel,
        postResponseBasketStatus,
        hasMore,
        size,
        categoryId,
        getCategoryStatus,
        categoryModel,
      ];
}
