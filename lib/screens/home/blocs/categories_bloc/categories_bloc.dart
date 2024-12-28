import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/home_model/category_model.dart';
import 'package:flutter_application_1/service/home_service/home_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const CategoriesState()) {
    on<CategoriesGetEvent>((event, emit) async {
      emit(state.copyWith(getCategoriesStatus: FormzSubmissionStatus.inProgress));
      final result = await HomeService.getCategories();
      if (result is CategoryModel) {
        emit(state.copyWith(categories: result, getCategoriesStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getCategoriesStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
