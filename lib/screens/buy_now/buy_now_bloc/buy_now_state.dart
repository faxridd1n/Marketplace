part of 'buy_now_bloc.dart';

class BuyNowState extends Equatable {
  final FormzSubmissionStatus getRegionsStatus;
  final LocationModel? regionModel;
 final FormzSubmissionStatus getDistrictsStatus;
  final LocationModel? districtModel;

  const BuyNowState({
    this.getRegionsStatus = FormzSubmissionStatus.initial,
    this.regionModel,
    this.getDistrictsStatus = FormzSubmissionStatus.initial,
    this.districtModel,
  });

  BuyNowState copyWith({
    FormzSubmissionStatus? getRegionsStatus,
    LocationModel? regionModel,
    FormzSubmissionStatus? getDistrictsStatus,
    LocationModel? districtModel,
  
  }) {
    return BuyNowState(
      getRegionsStatus: getRegionsStatus ?? this.getRegionsStatus,
      regionModel: regionModel ?? this.regionModel,
      getDistrictsStatus: getDistrictsStatus ?? this.getDistrictsStatus,
      districtModel: districtModel ?? this.districtModel,
      
    );
  }

  @override
  List<Object?> get props => [
        getRegionsStatus,
        regionModel,
       getDistrictsStatus,
        districtModel,
      ];
}
