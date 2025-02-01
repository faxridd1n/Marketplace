import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/get_user_cards_response_model.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/post_user_add_card_confirm_response_model.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/post_user_card_response_model.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/general_response_model.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/request_models/post_user_add_card_request_model.dart';
import 'package:flutter_application_1/service/profile_service/user_cards_service/user_cards_services.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
part 'user_cards_event.dart';
part 'user_cards_state.dart';

class UserCardsBloc extends Bloc<UserCardsEvent, UserCardsState> {
  UserCardsBloc() : super(const UserCardsState()) {
    on<GetUserCardsResponseEvent>((event, emit) async {
      emit(state.copyWith(
          getUserCardsResponseStatus: FormzSubmissionStatus.inProgress));
      final result = await UserCardsServices.getUserCards();
      if (result is GetUserCardsResponseModel) {
        emit(state.copyWith(
            getUserCardsResponseModel: result,
            getUserCardsResponseStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            getUserCardsResponseStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostUserCardResponseEvent>((event, emit) async {
      emit(state.copyWith(
          postUserCardResponseStatus: FormzSubmissionStatus.inProgress));
      final result = await UserCardsServices.postUserCards(
        event.postUserAddCardRequestModel,
      );
      if (result is PostUserCardResponseModel) {
        emit(state.copyWith(
            postUserCardResponseModel: result,
            postUserCardResponseStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            postUserCardResponseStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostUserAddCardConfirmResponseEvent>((event, emit) async {
      emit(state.copyWith(
          postUserAddCardConfirmResponsStatus:
              FormzSubmissionStatus.inProgress));
      final result = await UserCardsServices.postUserAddCardConfirm(
        event.otp,
        event.session,
      );
      if (result is PostUserAddCardConfirmResponseModel) {
        emit(state.copyWith(
          postUserAddCardConfirmResponseModel: result,
          postUserAddCardConfirmResponsStatus: FormzSubmissionStatus.success,
        ));
        add(GetUserCardsResponseEvent());
      } else {
        emit(state.copyWith(
          postUserAddCardConfirmResponsStatus: FormzSubmissionStatus.failure,
        ));
      }
    });

    on<PutUserMainCardEvent>((event, emit) async {
      emit(state.copyWith(
          putUserMainCardResponseStatus: FormzSubmissionStatus.inProgress));
      final result = await UserCardsServices.putMainCard(event.cardId);
      if (result is GeneralResponseModel) {
        emit(state.copyWith(
            putUserMainCardResponseModel: result,
            putUserMainCardResponseStatus: FormzSubmissionStatus.success));
        add(GetUserCardsResponseEvent());
      } else {
        emit(state.copyWith(
            putUserMainCardResponseStatus: FormzSubmissionStatus.failure));
      }
    });

    on<DeleteUserCardEvent>((event, emit) async {
      emit(state.copyWith(
          deleteUserCardResponseStatus: FormzSubmissionStatus.inProgress));
      final result = await UserCardsServices.deleteUserCard(event.cardId);
      if (result is GeneralResponseModel) {
        emit(state.copyWith(
            deleteUserCardResponseModel: result,
            deleteUserCardResponseStatus: FormzSubmissionStatus.success));
        add(GetUserCardsResponseEvent());
      } else {
        emit(state.copyWith(
            deleteUserCardResponseStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
