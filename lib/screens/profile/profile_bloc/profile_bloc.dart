import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/user_model/user_model.dart';
import 'package:flutter_application_1/service/auth_service/auth_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/basket_model/PostBasketProductModel.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<PostAuthUser>((event, emit) async {
      emit(
          state.copyWith(postAuthUserStatus: FormzSubmissionStatus.inProgress));
      final result = await ProfileService.postAuthUser(event.phoneNumber);
      if (result is PostResponseBasketModel) {
        emit(state.copyWith(
            userModel: result,
            postAuthUserStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(postAuthUserStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
