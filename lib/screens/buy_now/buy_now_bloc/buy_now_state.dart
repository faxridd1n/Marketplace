part of 'buy_now_bloc.dart';

class BuyNowState extends Equatable {
  final FormzSubmissionStatus getRegionsStatus;
  final LocationModel? regionModel;
  final FormzSubmissionStatus getDistrictsStatus;
  final LocationModel? districtModel;
  final PostOrderResponseModel? postOrderResponseModel;
  final FormzSubmissionStatus postOrderResponseStatus;
  final BasketProductModel? basketResponseModel;
  final FormzSubmissionStatus getBasketProductStatus;
  final OrganizationContactModel? organizationContactModel;
  final FormzSubmissionStatus organizationContactStatus;

  const BuyNowState({
    this.basketResponseModel,
    this.getBasketProductStatus = FormzSubmissionStatus.initial,
    this.getRegionsStatus = FormzSubmissionStatus.initial,
    this.regionModel,
    this.getDistrictsStatus = FormzSubmissionStatus.initial,
    this.districtModel,
    this.postOrderResponseModel,
    this.postOrderResponseStatus = FormzSubmissionStatus.initial,
    this.organizationContactModel,
    this.organizationContactStatus = FormzSubmissionStatus.initial,
  });

  BuyNowState copyWith({
    BasketProductModel? basketResponseModel,
    FormzSubmissionStatus? getBasketProductStatus,
    FormzSubmissionStatus? getRegionsStatus,
    LocationModel? regionModel,
    FormzSubmissionStatus? getDistrictsStatus,
    LocationModel? districtModel,
    PostOrderResponseModel? postOrderResponseModel,
    FormzSubmissionStatus? postOrderResponseStatus,
    OrganizationContactModel? organizationContactModel,
    FormzSubmissionStatus? organizationContactStatus,
  }) {
    return BuyNowState(
      basketResponseModel: basketResponseModel ?? this.basketResponseModel,
      getBasketProductStatus:
          getBasketProductStatus ?? this.getBasketProductStatus,
      getRegionsStatus: getRegionsStatus ?? this.getRegionsStatus,
      regionModel: regionModel ?? this.regionModel,
      getDistrictsStatus: getDistrictsStatus ?? this.getDistrictsStatus,
      districtModel: districtModel ?? this.districtModel,
      postOrderResponseModel:
          postOrderResponseModel ?? this.postOrderResponseModel,
      postOrderResponseStatus:
          postOrderResponseStatus ?? this.postOrderResponseStatus,
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
        getRegionsStatus,
        regionModel,
        getDistrictsStatus,
        districtModel,
        postOrderResponseModel,
        postOrderResponseStatus,
        organizationContactModel,
        organizationContactStatus,
      ];
}
