import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/login_model/post_login_response_model.dart';
import 'package:flutter_application_1/service/auth_service/auth_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import '../../../models/login_model/put_login_otp_response_model.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<PostLoginUserEvent>((event, emit) async {
      emit(state.copyWith(
          postLoginUserResponseStatus: FormzSubmissionStatus.inProgress));
      final result = await AuthService.postLoginUser(event.phoneNumber);
      if (result is PostLoginResponseModel) {
        emit(state.copyWith(
            postloginResponseModel: result,
            postLoginUserResponseStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            postLoginUserResponseStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PutLoginOtpEvent>((event, emit) async {
      emit(state.copyWith(
          putLoginResponseStatus: FormzSubmissionStatus.inProgress));
      final result = await AuthService.putOTP(event.phoneNumber, event.otp);
      if (result is PutLoginOtpResponseModel) {
        emit(state.copyWith(
          putLoginOtpResponseModel: result,
          putLoginResponseStatus: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(
          putLoginResponseStatus: FormzSubmissionStatus.failure,
        ));
      }
    });
  }
}
