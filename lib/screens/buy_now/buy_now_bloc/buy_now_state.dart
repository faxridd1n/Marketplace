part of 'buy_now_bloc.dart';

class BuyNowState extends Equatable {
  final FormzSubmissionStatus getRegionsStatus;
  final LocationModel? regionModel;
  final FormzSubmissionStatus getDistrictsStatus;
  final LocationModel? districtModel;
  final PostOrderResponseModel? postOrderResponseModel;
  final FormzSubmissionStatus postOrderResponseStatus;

  const BuyNowState({
    this.getRegionsStatus = FormzSubmissionStatus.initial,
    this.regionModel,
    this.getDistrictsStatus = FormzSubmissionStatus.initial,
    this.districtModel,
    this.postOrderResponseModel,
    this.postOrderResponseStatus = FormzSubmissionStatus.initial,
  });

  BuyNowState copyWith({
    FormzSubmissionStatus? getRegionsStatus,
    LocationModel? regionModel,
    FormzSubmissionStatus? getDistrictsStatus,
    LocationModel? districtModel,
    PostOrderResponseModel? postOrderResponseModel,
    FormzSubmissionStatus? postOrderResponseStatus,
  }) {
    return BuyNowState(
        getRegionsStatus: getRegionsStatus ?? this.getRegionsStatus,
        regionModel: regionModel ?? this.regionModel,
        getDistrictsStatus: getDistrictsStatus ?? this.getDistrictsStatus,
        districtModel: districtModel ?? this.districtModel,
        postOrderResponseModel:
            postOrderResponseModel ?? this.postOrderResponseModel,
        postOrderResponseStatus:
            postOrderResponseStatus ?? this.postOrderResponseStatus);
  }

  @override
  List<Object?> get props => [
        getRegionsStatus,
        regionModel,
        getDistrictsStatus,
        districtModel,
        postOrderResponseModel,
        postOrderResponseStatus,
      ];
}
