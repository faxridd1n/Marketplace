import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/order_model/post_order_request_model.dart';
// import 'package:flutter_application_1/models/order_model/post_order_response_model.dart';
import 'package:flutter_application_1/models/profile_model/editted_user_info_response_model.dart';
import 'package:flutter_application_1/models/order_model/user_orders_model.dart';
import 'package:flutter_application_1/models/profile_model/user_profile_model.dart';
import 'package:flutter_application_1/service/order_service/order_service.dart';
import 'package:flutter_application_1/service/profile_service/profile_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<GetUserProfile>((event, emit) async {
      emit(state.copyWith(
          getUserProfileStatus: FormzSubmissionStatus.inProgress));
      final result = await ProfileService.getUserProfile();
      if (result is UserProfileModel) {
        emit(state.copyWith(
            userProfileModel: result,
            getUserProfileStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            getUserProfileStatus: FormzSubmissionStatus.failure));
      }
    });

    // on<GetUserOrdersEvent>((event, emit) async {
    //   emit(state.copyWith(
    //       getUserOrdersStatus: FormzSubmissionStatus.inProgress));
    //   final result = await OrderService.getUserOrders();
    //   if (result is UserOrdersModel) {
    //     emit(state.copyWith(
    //         userOrdersModel: result,
    //         getUserOrdersStatus: FormzSubmissionStatus.success));
    //   } else {
    //     emit(
    //         state.copyWith(getUserOrdersStatus: FormzSubmissionStatus.failure));
    //   }
    // });

    on<PostOrderResponseEvent>((event, emit) async {
      emit(state.copyWith(
          getUserOrdersStatus: FormzSubmissionStatus.inProgress));
      final result = await OrderService.postUserOrders(PostOrderRequestModel());
      if (result is UserOrdersModel) {
        emit(state.copyWith(
            userOrdersModel: result,
            getUserOrdersStatus: FormzSubmissionStatus.success));
      } else {
        emit(
            state.copyWith(getUserOrdersStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostFinishedOrderResponseEvent>((event, emit) async {
      emit(state.copyWith(
          getUserFinishedOrdersStatus: FormzSubmissionStatus.inProgress));
      final result =
          await OrderService.postUserFinishedOrders(PostOrderRequestModel());
      if (result is UserOrdersModel) {
        emit(state.copyWith(
            userFinishedOrdersModel: result,
            getUserFinishedOrdersStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            getUserFinishedOrdersStatus: FormzSubmissionStatus.failure));
      }
    });

    on<EditUserInfoEvent>((event, emit) async {
      emit(state.copyWith(
        getUserProfileStatus: FormzSubmissionStatus.inProgress,
        editUserInfoStatus: FormzSubmissionStatus.inProgress,
      ));
      final result =
          await ProfileService.editUserInfo(event.firstName, event.lastName);
      final result2 = await ProfileService.getUserProfile();
      if (result is EdittedUserInfoResponseModel ||
          result2 is UserProfileModel) {
        emit(state.copyWith(
          getUserProfileStatus: FormzSubmissionStatus.success,
          userProfileModel: result2,
          editUserInfoStatus: FormzSubmissionStatus.success,
          edittedUserInfoResponseModel: result,
        ));
        // add(GetUserProfile());
      } else {
        emit(state.copyWith(
          getUserProfileStatus: FormzSubmissionStatus.failure,
          editUserInfoStatus: FormzSubmissionStatus.failure,
        ));
      }
    });
  }
}
