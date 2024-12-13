import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/basket_model/post_basket_product_model.dart';
import '../../../models/products_model/product_model.dart';
import '../../../models/see_all_model/filtered_search_model.dart';
import '../../../service/see_all_service/see_all_sevice.dart';

part 'see_all_event.dart';
part 'see_all_state.dart';

class SeeAllBloc extends Bloc<SeeAllEvent, SeeAllState> {
  SeeAllBloc() : super(const SeeAllState()) {
    on<GetAllProductsEvent>((event, emit) async {
      emit(state.copyWith(getProductStatus: FormzSubmissionStatus.inProgress));
      final result = await SeeAllSevice.getAllProducts(event.categoryId);
      if (result is List<ProductModel>) {
        emit(state.copyWith(productModel: result, getProductStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getProductStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetSearchFiltersEvent>((event, emit) async {
      emit(state.copyWith(getFilteredProductStatus: FormzSubmissionStatus.inProgress));
      final result = await SeeAllSevice.getSearchFilters(event.categoryId);
      if (result is List<FilteredSearchModel>) {
        emit(state.copyWith(filteredProductModel: result, getFilteredProductStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getFilteredProductStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostBasketProductSeeAllEvent>((event, emit) async {
      emit(state.copyWith(postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result = await SeeAllSevice.postBasketProducts(event.productVariationId);
      if (result is PostResponseBasketModel) {
        emit(state.copyWith(postResponseBasketModel: result, postResponseBasketStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(postResponseBasketStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
