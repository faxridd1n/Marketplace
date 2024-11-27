import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/register_model/register_confirm_model/register_confirm_request_model.dart';
import 'package:flutter_application_1/models/register_model/register_confirm_model/register_confirm_response_model.dart';
import 'package:flutter_application_1/models/register_model/register_model/register_user_request_model.dart';
import 'package:flutter_application_1/models/register_model/register_model/register_user_response_model.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import '../../../service/register_service/register_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    
 on<RegisterUserEvent>((event, emit) async {
      // Emit the in-progress state
      emit(state.copyWith(
          registerUserResponseStatus: FormzSubmissionStatus.inProgress));

      // Call the RegisterService to register the user
      final result = await RegisterService.registerUser(event.registerUserRequestModel);

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
      final result = await RegisterService.registerConfirm(event.confirmRequestModel);
      if (result is RegisterConfirmResponseModel) {
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
