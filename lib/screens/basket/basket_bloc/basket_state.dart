part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final BasketProductModel basketResponseModel;
  final FormzSubmissionStatus getBasketProductStatus;

  final GeneralResponseModel basketDeleteResModel;
  final FormzSubmissionStatus basketDeleteResStatus;

  final GeneralResponseModel deleteBasketAllResponseModel;
  final FormzSubmissionStatus deleteBasketAllResponseStatus;

  final GeneralResponseModel postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;

  // final List<ProductElement> selectedProducts;
  final OrganizationContactModel organizationContactModel;
  final FormzSubmissionStatus organizationContactStatus;

  const BasketState({
    this.basketResponseModel = const BasketProductModel(),
    this.getBasketProductStatus = FormzSubmissionStatus.initial,
    this.basketDeleteResModel = const GeneralResponseModel(),
    this.basketDeleteResStatus = FormzSubmissionStatus.initial,
    this.deleteBasketAllResponseModel = const GeneralResponseModel(),
    this.deleteBasketAllResponseStatus = FormzSubmissionStatus.initial,
    this.postResponseBasketModel = const GeneralResponseModel(),
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
    // this.selectedProducts = const [],
    this.organizationContactModel = const OrganizationContactModel(),
    this.organizationContactStatus = FormzSubmissionStatus.initial,
  });

  BasketState copyWith({
    BasketProductModel? basketResponseModel,
    FormzSubmissionStatus? getBasketProductStatus,
    GeneralResponseModel? basketDeleteResModel,
    FormzSubmissionStatus? basketDeleteResStatus,
    GeneralResponseModel? deleteBasketAllResponseModel,
    FormzSubmissionStatus? deleteBasketAllResponseStatus,
    GeneralResponseModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
    // List<ProductElement>? selectedProducts,
    OrganizationContactModel? organizationContactModel,
    FormzSubmissionStatus? organizationContactStatus,
  }) {
    return BasketState(
      basketResponseModel: basketResponseModel ?? this.basketResponseModel,
      getBasketProductStatus:
          getBasketProductStatus ?? this.getBasketProductStatus,
      basketDeleteResModel: basketDeleteResModel ?? this.basketDeleteResModel,
      basketDeleteResStatus:
          basketDeleteResStatus ?? this.basketDeleteResStatus,
      deleteBasketAllResponseModel:
          deleteBasketAllResponseModel ?? this.deleteBasketAllResponseModel,
      deleteBasketAllResponseStatus:
          deleteBasketAllResponseStatus ?? this.deleteBasketAllResponseStatus,
      postResponseBasketModel:
          postResponseBasketModel ?? this.postResponseBasketModel,
      postResponseBasketStatus:
          postResponseBasketStatus ?? this.postResponseBasketStatus,
      // selectedProducts: selectedProducts ?? this.selectedProducts,
      organizationContactModel:
          organizationContactModel ?? this.organizationContactModel,
      organizationContactStatus:
          organizationContactStatus ?? this.organizationContactStatus,
    );
  }

  @override
  List<Object?> get props => [
        postResponseBasketModel,
        postResponseBasketStatus,
        basketResponseModel,
        getBasketProductStatus,
        basketDeleteResStatus,
        basketDeleteResModel,
        deleteBasketAllResponseModel,
        deleteBasketAllResponseStatus,
        // selectedProducts,
        organizationContactModel,
        organizationContactStatus,
      ];
}
