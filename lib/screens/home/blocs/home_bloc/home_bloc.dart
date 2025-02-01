import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/home_model/organization_model.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/general_response_model.dart';
import 'package:flutter_application_1/service/home_service/home_service.dart';
import 'package:formz/formz.dart';


part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetOrganizationsEvent>((event, emit) async {
      emit(state.copyWith(getOrganizationStatus: FormzSubmissionStatus.inProgress));
      final result = await HomeService.getOrganizations();
      if (result is List<OrganizationModel>) {
        emit(state.copyWith(organizationModel: result, getOrganizationStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getOrganizationStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostBasketProductHomeEvent>((event, emit) async {
      emit(state.copyWith(postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result = await HomeService.postBasketProducts(event.productVariationId, event.count);
      if (result is GeneralResponseModel) {
        emit(state.copyWith(postResponseBasketModel: result, postResponseBasketStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(postResponseBasketStatus: FormzSubmissionStatus.failure));
      }
    });

  }
}
