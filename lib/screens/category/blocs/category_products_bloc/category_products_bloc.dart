import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/general_response_model.dart';
import 'package:flutter_application_1/service/katalog_service/katalog_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../../models/products_model/product_model.dart';

part 'category_products_event.dart';
part 'category_products_state.dart';

class CategoryProductsBloc extends Bloc<CategoryProductsEvent, CategoryProductsState> {
  CategoryProductsBloc() : super(const CategoryProductsState()) {
    on<GetCategoryProductsEvent>((event, emit) async {
      emit(state.copyWith(getFilteredProductStatus: FormzSubmissionStatus.inProgress));
      final result = await KatalogService.getFilteredProducts(event.categoryId,event.size,event.page);
      if (result is List<ProductModel>) {
        emit(state.copyWith(filteredProductModel: result, getFilteredProductStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getFilteredProductStatus: FormzSubmissionStatus.failure));
      }
    });


    on<PostBasketProductCategoryProductsEvent>((event, emit) async {
      emit(state.copyWith(
          postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result =
          await KatalogService.postBasketProducts(event.productVariationId);
      if (result is GeneralResponseModel) {
        emit(state.copyWith(
            postResponseBasketModel: result,
            postResponseBasketStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            postResponseBasketStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
