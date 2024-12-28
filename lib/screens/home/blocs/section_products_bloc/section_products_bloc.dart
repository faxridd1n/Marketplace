import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/service/home_service/home_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'section_products_event.dart';

part 'section_products_state.dart';

class SectionProductsBloc extends Bloc<SectionProductsEvent, SectionProductsState> {
  SectionProductsBloc() : super(const SectionProductsState()) {
    on<GetSectionProductsEvent>((event, emit) async {
      emit(state.copyWith(getProductsStatus: FormzSubmissionStatus.inProgress));
      final result = await HomeService.getSectionProducts(event.sectionId);
      if (result is List<ProductModel>) {
        emit(
          state.copyWith(
            products: result,
            getProductsStatus: FormzSubmissionStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            getProductsStatus: FormzSubmissionStatus.failure,
          ),
        );
      }
    });
  }
}
