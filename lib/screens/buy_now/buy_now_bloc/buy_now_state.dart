part of 'buy_now_bloc.dart';

class BuyNowState extends Equatable {
  final int paymentType;
  final int deliveryType;
  final int regionId;
  final int destrictId;
  final String address;
  final String comment;
  final List<Item> items;
  final FormzSubmissionStatus getRegionsStatus;
  final LocationModel regionModel;
  final FormzSubmissionStatus getDistrictsStatus;
  final LocationModel districtModel;
  final PostOrderResponseModel postOrderResponseModel;
  final FormzSubmissionStatus postOrderResponseStatus;
  final BasketProductModel basketResponseModel;
  final FormzSubmissionStatus getBasketProductStatus;
  final OrganizationContactModel organizationContactModel;
  final FormzSubmissionStatus organizationContactStatus;
  final UserProfileModel userProfileModel;
  final FormzSubmissionStatus getUserProfileStatus;

  const BuyNowState(
      {this.paymentType = -1,
      this.deliveryType = -1,
      this.regionId = -1,
      this.destrictId = -1,
      this.address = '',
      this.comment = '',
      this.items = const [],
      this.basketResponseModel = const BasketProductModel(),
      this.getBasketProductStatus = FormzSubmissionStatus.initial,
      this.getRegionsStatus = FormzSubmissionStatus.initial,
      this.regionModel=const LocationModel(),
      this.getDistrictsStatus = FormzSubmissionStatus.initial,
      this.districtModel=const LocationModel(),
      this.postOrderResponseModel = const PostOrderResponseModel(),
      this.postOrderResponseStatus = FormzSubmissionStatus.initial,
      this.organizationContactModel=const OrganizationContactModel(),
      this.organizationContactStatus = FormzSubmissionStatus.initial,
      this.getUserProfileStatus = FormzSubmissionStatus.initial,
      this.userProfileModel = const UserProfileModel()});

  BuyNowState copyWith({
    int? paymentType,
    int? deliveryType,
    int? regionId,
    int? destrictId,
    String? address,
    String? comment,
    List<Item>? items,
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
    UserProfileModel? userProfileModel,
    FormzSubmissionStatus? getUserProfileStatus,
  }) {
    return BuyNowState(
      paymentType: paymentType ?? this.paymentType,
      deliveryType: deliveryType ?? this.deliveryType,
      regionId: regionId ?? this.regionId,
      destrictId: destrictId ?? this.destrictId,
      address: address ?? this.address,
      comment: comment ?? this.comment,
      items: items ?? this.items,
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
      getUserProfileStatus: getUserProfileStatus ?? this.getUserProfileStatus,
      userProfileModel: userProfileModel ?? this.userProfileModel,
    );
  }

  @override
  List<Object?> get props => [
        paymentType,
        deliveryType,
        regionId,
        destrictId,
        address,
        comment,
        items,
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
        userProfileModel,
        getUserProfileStatus,
      ];
}
