part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final BasketProductModel? basketResponseModel;
  final FormzSubmissionStatus getBasketProductStatus;

  final BasketDeleteResModel? basketDeleteResModel;
  final FormzSubmissionStatus basketDeleteResStatus;
  final PostResponseBasketModel? postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;
  final List<ProductElement>? selectedProducts;

  const BasketState({
    this.basketResponseModel,
    this.getBasketProductStatus = FormzSubmissionStatus.initial,
    this.basketDeleteResModel,
    this.basketDeleteResStatus = FormzSubmissionStatus.initial,
    this.postResponseBasketModel,
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
    this.selectedProducts,
  });

  BasketState copyWith({
    BasketProductModel? basketResponseModel,
    FormzSubmissionStatus? getBasketProductStatus,
    BasketDeleteResModel? basketDeleteResModel,
    FormzSubmissionStatus? basketDeleteResStatus,
    PostResponseBasketModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
    List<ProductElement>? selectedProducts,
  }) {
    return BasketState(
      basketResponseModel: basketResponseModel ?? this.basketResponseModel,
      getBasketProductStatus:
          getBasketProductStatus ?? this.getBasketProductStatus,
      basketDeleteResModel: basketDeleteResModel ?? this.basketDeleteResModel,
      basketDeleteResStatus:
          basketDeleteResStatus ?? this.basketDeleteResStatus,
      postResponseBasketModel:
          postResponseBasketModel ?? this.postResponseBasketModel,
      postResponseBasketStatus:
          postResponseBasketStatus ?? this.postResponseBasketStatus,
      selectedProducts: selectedProducts ?? this.selectedProducts,
    );
  }

  @override
  List<Object?> get props => [
        basketResponseModel,
        getBasketProductStatus,
        basketDeleteResModel,
        basketDeleteResStatus,
        basketDeleteResModel,
        basketDeleteResStatus,
        selectedProducts,
      ];
}
