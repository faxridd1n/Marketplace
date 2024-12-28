part of 'section_products_bloc.dart';

class ProductsState extends Equatable {
  final int sectionId;
  final int categoryId;
  final List<ProductModel> products;
  final FormzSubmissionStatus getProductsStatus;
  final String getProductsErrorMessage;

  const ProductsState({
    this.sectionId = -1,
    this.categoryId = -1,
    this.products= const [],
    this.getProductsStatus = FormzSubmissionStatus.initial,
    this.getProductsErrorMessage = '',
  });

  ProductsState copyWith({
    int? sectionId,
    int? categoryId,
    List<ProductModel>? products,
    FormzSubmissionStatus? getProductsStatus,
    String? getProductsErrorMessage,
  }) {
    return ProductsState(
      sectionId: sectionId ?? this.sectionId,
      categoryId: categoryId ?? this.categoryId,
      products: products ?? this.products,
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      getProductsErrorMessage: getProductsErrorMessage ?? this.getProductsErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        sectionId,
        categoryId,
        products,
        getProductsStatus,
        getProductsErrorMessage,
      ];
}
