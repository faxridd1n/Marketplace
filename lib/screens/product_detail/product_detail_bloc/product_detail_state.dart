part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  final ProductDetailModel? productDetailModel;
  final FormzSubmissionStatus getDetailStatus;

  final List<ProductModel>? parentCategoryModel;
  final FormzSubmissionStatus getProductStatus;

  const ProductDetailState({
    this.productDetailModel,
    this.getDetailStatus = FormzSubmissionStatus.initial,
    this.parentCategoryModel,
    this.getProductStatus = FormzSubmissionStatus.initial,
  });

  ProductDetailState copyWith({
    ProductDetailModel? productDetailModel,
    FormzSubmissionStatus? getDetailStatus,
    List<ProductModel>? parentCategoryModel,
    FormzSubmissionStatus? getProductStatus,
  }) {
    return ProductDetailState(
      productDetailModel: productDetailModel ?? this.productDetailModel,
      getDetailStatus: getDetailStatus ?? this.getDetailStatus,
      parentCategoryModel: parentCategoryModel ?? this.parentCategoryModel,
      getProductStatus: getProductStatus ?? this.getProductStatus,
    );
  }

  @override
  List<Object?> get props => [
        productDetailModel,
        getDetailStatus,
        parentCategoryModel,
        getProductStatus,
      ];
}
