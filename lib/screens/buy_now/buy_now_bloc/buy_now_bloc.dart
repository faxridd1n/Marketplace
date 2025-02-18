import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/basket_model/basket_product_model.dart';
import 'package:flutter_application_1/models/buy_now_model/location_model.dart';
import 'package:flutter_application_1/models/order_model/post_order_response_model.dart';
import 'package:flutter_application_1/models/product_detail_model/organization_contact_model.dart';
import 'package:flutter_application_1/models/profile_model/user_profile_model.dart';
import 'package:flutter_application_1/service/basket_service/basket_service.dart';
import 'package:flutter_application_1/service/buy_now_service/buy_now_service.dart';
import 'package:flutter_application_1/service/product_service/product_service.dart';
import 'package:flutter_application_1/service/profile_service/profile_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/order_model/post_order_request_model.dart';
import '../../../service/order_service/order_service.dart';
// import '../../../service/order_service/order_service.dart';

part 'buy_now_event.dart';
part 'buy_now_state.dart';

class BuyNowBloc extends Bloc<BuyNowEvent, BuyNowState> {
  BuyNowBloc() : super(const BuyNowState()) {
    on<GetBasketProductsEvent>((event, emit) async {
      emit(state.copyWith(
        getBasketProductStatus: FormzSubmissionStatus.inProgress,
      ));
      final result = await BasketService.getBasketProducts();
      if (result is BasketProductModel) {
        emit(state.copyWith(
          basketResponseModel: result,
          getBasketProductStatus: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(
          getBasketProductStatus: FormzSubmissionStatus.failure,
        ));
      }
    });
    on<GetUserProfileEvent>((event, emit) async {
      emit(state.copyWith(
        getUserProfileStatus: FormzSubmissionStatus.inProgress,
      ));
      final result = await ProfileService.getUserProfile();
      if (result is UserProfileModel) {
        emit(state.copyWith(
          userProfileModel: result,
          getUserProfileStatus: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(
          getUserProfileStatus: FormzSubmissionStatus.failure,
        ));
      }
    });
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

    on<GetOrganizationEvent>((event, emit) async {
      emit(state.copyWith(
          organizationContactStatus: FormzSubmissionStatus.inProgress));
      final result =
          await ProductService.getOrganizationContact(event.organizationId);
      if (result is OrganizationContactModel) {
        emit(state.copyWith(
            organizationContactModel: result,
            organizationContactStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            organizationContactStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostUsersOrderEvent>((event, emit) async {
      emit(state.copyWith(
          postOrderResponseStatus: FormzSubmissionStatus.inProgress));
      final result = await OrderService.postUserOrders(event.orderRequestModel);
      if (result is PostOrderResponseModel) {
        emit(state.copyWith(
            postOrderResponseModel: result,
            postOrderResponseStatus: FormzSubmissionStatus.success));
        add(GetBasketProductsEvent());
      } else {
        emit(state.copyWith(
            postOrderResponseStatus: FormzSubmissionStatus.failure));
      }
    });

    on<SelectPaymentTypeEvent>((event, emit) async {
      emit(state.copyWith(paymentType: event.paymentType));
    });

    on<SelectDeliveryTypeEvent>((event, emit) async {
      emit(state.copyWith(deliveryType: event.deliveryType));
    });

    on<SelectRegionEvent>((event, emit) async {
      emit(state.copyWith(regionId: event.regionId));
    });
    on<GetUserInfoEvent>((event, emit) async {
      emit(state.copyWith(
        fullName: event.fullName,
        phone: event.phone,
      ));
    });

    on<SelectDistrictEvent>((event, emit) async {
      emit(state.copyWith(destrictId: event.districtId));
    });
    on<FillAddressEvent>((event, emit) async {
      emit(state.copyWith(address: event.address));
    });
    on<FillCommentEvent>((event, emit) async {
      emit(state.copyWith(comment: event.comment));
    });
    on<GetVariationEvent>((event, emit) async {
      emit(state.copyWith(items: event.items));
    });
  }
}
