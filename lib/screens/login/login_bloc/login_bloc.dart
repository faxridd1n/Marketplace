import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/login_model/login_model.dart';
import 'package:flutter_application_1/service/auth_service/auth_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/basket_model/post_basket_product_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<PostLoginUserEvent>((event, emit) async {
      emit(state.copyWith(
          postLoginUserStatus: FormzSubmissionStatus.inProgress));
      final result = await AuthService.postLoginUser(event.phoneNumber);
      if (result is PostResponseBasketModel) {
        emit(state.copyWith(
            loginModel: result,
            postLoginUserStatus: FormzSubmissionStatus.success));
      } else {
        emit(
            state.copyWith(postLoginUserStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
