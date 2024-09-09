part of 'katalog_bloc.dart';

class KatalogState extends Equatable {
  final List<ProductModel>? filteredProductModel;
  final FormzSubmissionStatus getFilteredProductStatus;
  final PostResponseBasketModel? postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;
  final bool? hasMore;
  final int? size;
  final int? categoryId;

  const KatalogState({
    this.filteredProductModel,
    this.getFilteredProductStatus = FormzSubmissionStatus.initial,
    this.postResponseBasketModel,
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
    this.hasMore=true,
    this.size=10,
    this.categoryId,
  });

  KatalogState copyWith({
    List<ProductModel>? filteredProductModel,
    FormzSubmissionStatus? getFilteredProductStatus,
    PostResponseBasketModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
    bool? hasMore,
    int? size,
    int? categoryId,
  }) {
    return KatalogState(
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
