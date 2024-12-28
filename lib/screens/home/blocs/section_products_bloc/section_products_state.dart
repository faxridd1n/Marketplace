part of 'section_products_bloc.dart';

class SectionProductsState extends Equatable {
  final List<ProductModel> products;
  final FormzSubmissionStatus getProductsStatus;
  final String getProductsErrorMessage;

  const SectionProductsState({
    this.products= const [],
    this.getProductsStatus = FormzSubmissionStatus.initial,
    this.getProductsErrorMessage = '',
  });

  SectionProductsState copyWith({
    List<ProductModel>? products,
    FormzSubmissionStatus? getProductsStatus,
    String? getProductsErrorMessage,
  }) {
    return SectionProductsState(
      products: products ?? this.products,
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      getProductsErrorMessage: getProductsErrorMessage ?? this.getProductsErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        products,
        getProductsStatus,
        getProductsErrorMessage,
      ];
}
