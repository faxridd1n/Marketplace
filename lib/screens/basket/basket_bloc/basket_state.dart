part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final BasketProductModel basketResponseModel;
  final FormzSubmissionStatus getBasketProductStatus;

  final int basketProductCount;

  final GeneralResponseModel basketDeleteResModel;
  final FormzSubmissionStatus basketDeleteResStatus;

  final GeneralResponseModel deleteBasketAllResponseModel;
  final FormzSubmissionStatus deleteBasketAllResponseStatus;

  final GeneralResponseModel postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;

  final GeneralResponseModel postResponseBasketModelOnlyBuyNow;
  final FormzSubmissionStatus postResponseBasketStatusOnlyBuyNow;

  // final List<ProductElement> selectedProducts;
  final OrganizationContactModel organizationContactModel;
  final FormzSubmissionStatus organizationContactStatus;

  const BasketState({
    this.basketProductCount = 0,
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
    this.postResponseBasketModelOnlyBuyNow = const GeneralResponseModel(),
    this.postResponseBasketStatusOnlyBuyNow = FormzSubmissionStatus.initial,
  });

  BasketState copyWith({
    int? basketProductCount,
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
    GeneralResponseModel? postResponseBasketModelOnlyBuyNow,
    FormzSubmissionStatus? postResponseBasketStatusOnlyBuyNow,
  }) {
    return BasketState(
      basketProductCount: basketProductCount ?? this.basketProductCount,
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
      postResponseBasketModelOnlyBuyNow: postResponseBasketModelOnlyBuyNow ??
          this.postResponseBasketModelOnlyBuyNow,
      postResponseBasketStatusOnlyBuyNow: postResponseBasketStatusOnlyBuyNow ??
          this.postResponseBasketStatusOnlyBuyNow,
    );
  }

  @override
  List<Object?> get props => [
        basketProductCount,
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
        postResponseBasketModelOnlyBuyNow,
        postResponseBasketStatusOnlyBuyNow,
      ];
}
