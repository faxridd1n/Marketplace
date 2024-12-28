part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final BasketProductModel basketResponseModel;
  final FormzSubmissionStatus getBasketProductStatus;

  final BasketDeleteResModel basketDeleteResModel;
  final FormzSubmissionStatus basketDeleteResStatus;
  final PostResponseBasketModel postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;
  final List<ProductElement> selectedProducts;
  final OrganizationContactModel organizationContactModel;
  final FormzSubmissionStatus organizationContactStatus;

  const BasketState({
    this.basketResponseModel = const BasketProductModel(),
    this.getBasketProductStatus = FormzSubmissionStatus.initial,
    this.basketDeleteResModel = const BasketDeleteResModel(),
    this.basketDeleteResStatus = FormzSubmissionStatus.initial,
    this.postResponseBasketModel = const PostResponseBasketModel(),
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
    this.selectedProducts = const [],
    this.organizationContactModel = const OrganizationContactModel(),
    this.organizationContactStatus = FormzSubmissionStatus.initial,
  });

  BasketState copyWith({
    BasketProductModel? basketResponseModel,
    FormzSubmissionStatus? getBasketProductStatus,
    BasketDeleteResModel? basketDeleteResModel,
    FormzSubmissionStatus? basketDeleteResStatus,
    PostResponseBasketModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
    List<ProductElement>? selectedProducts,
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
      postResponseBasketModel:
          postResponseBasketModel ?? this.postResponseBasketModel,
      postResponseBasketStatus:
          postResponseBasketStatus ?? this.postResponseBasketStatus,
      selectedProducts: selectedProducts ?? this.selectedProducts,
      organizationContactModel:
          organizationContactModel ?? this.organizationContactModel,
      organizationContactStatus:
          organizationContactStatus ?? this.organizationContactStatus,
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
        organizationContactModel,
        organizationContactStatus,
      ];
}
