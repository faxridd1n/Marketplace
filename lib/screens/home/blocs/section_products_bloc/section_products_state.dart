part of 'section_products_bloc.dart';

class ProductsState extends Equatable {
  final int sectionId;
  final int categoryId;
  final List<ProductModel> products;
  final FormzSubmissionStatus getProductsStatus;
  final List<ProductModel> filteredProducts;
  final FormzSubmissionStatus filteredProductStatus;
  final String getProductsErrorMessage;
  final bool hasMoreProducts;
  final String next;
  final FilteredSearchModel filteredSearchModel;
  final FormzSubmissionStatus getFilteredSerchStatus;

  const ProductsState({
    this.sectionId = -1,
    this.categoryId = -1,
    this.products = const [],
    this.getProductsStatus = FormzSubmissionStatus.initial,
    this.filteredProducts = const [],
    this.filteredProductStatus = FormzSubmissionStatus.initial,
    this.getProductsErrorMessage = '',
    this.hasMoreProducts = true,
    this.next = '',
    this.filteredSearchModel = const FilteredSearchModel(),
    this.getFilteredSerchStatus = FormzSubmissionStatus.initial,
  });

  ProductsState copyWith({
    int? sectionId,
    int? categoryId,
    List<ProductModel>? products,
    FormzSubmissionStatus? getProductsStatus,
    List<ProductModel>? filteredProducts,
    FormzSubmissionStatus? filteredProductStatus,
    String? getProductsErrorMessage,
    FilteredSearchModel? filteredSearchModel,
    FormzSubmissionStatus? getFilteredSerchStatus,
    bool? hasMoreProducts,
    String? next,
  }) {
    return ProductsState(
      sectionId: sectionId ?? this.sectionId,
      categoryId: categoryId ?? this.categoryId,
      products: products ?? this.products,
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      filteredProductStatus:
          filteredProductStatus ?? this.filteredProductStatus,
      getProductsErrorMessage:
          getProductsErrorMessage ?? this.getProductsErrorMessage,
      filteredSearchModel: filteredSearchModel ?? this.filteredSearchModel,
      getFilteredSerchStatus:
          getFilteredSerchStatus ?? this.getFilteredSerchStatus,
      hasMoreProducts: hasMoreProducts ?? this.hasMoreProducts,
      next: next ?? this.next,
    );
  }

  @override
  List<Object> get props => [
        sectionId,
        categoryId,
        products,
        getProductsStatus,
        filteredProducts,
        filteredProductStatus,
        getProductsErrorMessage,
        filteredSearchModel,
        getFilteredSerchStatus,
        hasMoreProducts,
        next,
      ];
}
