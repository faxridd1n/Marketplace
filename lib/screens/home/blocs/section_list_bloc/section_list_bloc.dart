import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/tabs_model/tabs_model.dart';
import 'package:flutter_application_1/service/home_service/home_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'section_list_event.dart';
part 'section_list_state.dart';

class SectionListBloc extends Bloc<SectionListEvent, SectionListState> {
  SectionListBloc() : super(const SectionListState()) {
    on<GetSectionListEvent>((event, emit) async {
      emit(state.copyWith(getTabsStatus: FormzSubmissionStatus.inProgress));
      final result = await HomeService.getTabs();
      if (result is TabsModel) {
        emit(state.copyWith(tabModel: result, getTabsStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getTabsStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
