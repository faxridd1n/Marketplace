import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/home_model/organization_model.dart';
import 'package:flutter_application_1/service/home_service/home_service.dart';
import 'package:formz/formz.dart';

part 'internet_connection_event.dart';

part 'internet_connection_state.dart';

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  InternetConnectionBloc() : super(const InternetConnectionState()) {
    on<InternetStatusChanged>((event, emit) async {
      emit(state.copyWith(internetStatus: FormzSubmissionStatus.inProgress));
      final result = await HomeService.getOrganizations();
      if (result is List<OrganizationModel>) {
        emit(state.copyWith(internetStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(internetStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
