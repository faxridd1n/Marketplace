import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/auth_model/register_confirm_model/register_confirm_request_model.dart';
import 'package:flutter_application_1/models/auth_model/register_confirm_model/register_confirm_response_model.dart';
import 'package:flutter_application_1/models/auth_model/register_model/register_user_request_model.dart';
import 'package:flutter_application_1/models/auth_model/register_model/register_user_response_model.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import '../../../service/auth_service/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    
 on<RegisterUserEvent>((event, emit) async {
      // Emit the in-progress state
      emit(state.copyWith(
          registerUserResponseStatus: FormzSubmissionStatus.inProgress));

      // Call the AuthService to register the user
      final result = await AuthService.registerUser(event.userModel);

      // Emit success or failure based on the result
      if (result is RegisterUserResponseModel) {
        emit(state.copyWith(
            registerUserResponseModel: result,
            registerUserResponseStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            registerUserResponseStatus: FormzSubmissionStatus.failure));
      }
    });

    on<RegisterConfirmRequestEvent>((event, emit) async {
      emit(state.copyWith(
          registerConfirmResponseStatus: FormzSubmissionStatus.inProgress));
      final result = await AuthService.registerConfirm(event.userModel);
      if (result is RegisterUserResponseModel) {
        emit(state.copyWith(
            registerConfirmResponseModel: result,
            registerConfirmResponseStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            registerConfirmResponseStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
