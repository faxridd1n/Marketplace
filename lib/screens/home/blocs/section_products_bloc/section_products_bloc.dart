import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/service/home_service/home_service.dart';
import 'package:flutter_application_1/service/product_service/product_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'section_products_event.dart';

part 'section_products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsState()) {
    on<GetProductsEvent>((event, emit) async {
      emit(state.copyWith(getProductsStatus: FormzSubmissionStatus.inProgress));
      final result = await ProductService.getProducts(GetProductParams(
        sectionId: state.sectionId,
        categoryId: state.categoryId,
      ));
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

    on<SetSectionIdEvent>((event, emit) async {
      emit(state.copyWith(sectionId: event.sectionId));
      add(GetProductsEvent());
    });

    on<SetCategoryIdEvent>((event, emit) async {
      emit(state.copyWith(categoryId: event.categoryId));
      add(GetProductsEvent());
    });
  }
}
