import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/profile_model/editted_user_info_response_model.dart';
import 'package:flutter_application_1/models/profile_model/user_orders_model.dart';
import 'package:flutter_application_1/models/profile_model/user_profile_model.dart';
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

    on<GetUserOrdersEvent>((event, emit) async {
      emit(state.copyWith(
          getUserOrdersStatus: FormzSubmissionStatus.inProgress));
      final result = await ProfileService.getUserOrders();
      if (result is UserOrdersModel) {
        emit(state.copyWith(
            userOrdersModel: result,
            getUserOrdersStatus: FormzSubmissionStatus.success));
      } else {
        emit(
            state.copyWith(getUserOrdersStatus: FormzSubmissionStatus.failure));
      }
    });

    on<EditUserInfoEvent>((event, emit) async {
      emit(
          state.copyWith(editUserInfoStatus: FormzSubmissionStatus.inProgress));
      final result =
          await ProfileService.editUserInfo(event.firstName, event.lastName);
      if (result is EdittedUserInfoResponseModel) {
        emit(state.copyWith(
            edittedUserInfoResponseModel: result,
            editUserInfoStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(editUserInfoStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
