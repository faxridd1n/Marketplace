import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/order_model/post_order_request_model.dart';
import 'package:flutter_application_1/models/order_model/post_order_response_model.dart';
import 'package:flutter_application_1/service/buy_now_service/buy_now_service.dart';
import 'package:flutter_application_1/service/order_service/order_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/buy_now_model/location_model.dart';

part 'buy_now_event.dart';
part 'buy_now_state.dart';

class BuyNowBloc extends Bloc<BuyNowEvent, BuyNowState> {
  BuyNowBloc() : super(const BuyNowState()) {
    on<GetRegionsEvent>((event, emit) async {
      emit(state.copyWith(getRegionsStatus: FormzSubmissionStatus.inProgress));
      final result = await BuyNowService.getRegions();
      if (result is LocationModel) {
        emit(state.copyWith(
            regionModel: result,
            getRegionsStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getRegionsStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetDistrictsEvent>((event, emit) async {
      emit(
          state.copyWith(getDistrictsStatus: FormzSubmissionStatus.inProgress));
      final result = await BuyNowService.getDistricts(event.regionId);
      if (result is LocationModel) {
        emit(state.copyWith(
            districtModel: result,
            getDistrictsStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getDistrictsStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostUsersOrderEvent>((event, emit) async {
      emit(state.copyWith(
          postOrderResponseStatus: FormzSubmissionStatus.inProgress));
      final result =
          await OrderService.postUserOrders(event.postOrderRequestModel);
      if (result is PostOrderResponseModel) {
        emit(state.copyWith(
            postOrderResponseModel: result,
            postOrderResponseStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            postOrderResponseStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
