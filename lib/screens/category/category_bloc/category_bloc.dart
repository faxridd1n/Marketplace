import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/basket_model/post_basket_product_model.dart';
import 'package:flutter_application_1/service/category_service/category_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/home_model/category_model.dart';
import '../../../models/products_model/product_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {

 on<GetCategoriesEvent>((event, emit) async {
      emit(state.copyWith(getCategoryStatus: FormzSubmissionStatus.inProgress));
      final result = await CategoryService.getCategories();
      if (result is CategoryModel) {
        emit(state.copyWith(
            categoryModel: result,
            getCategoryStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getCategoryStatus: FormzSubmissionStatus.failure));
      }
    });


    // on<GetCategoryEvent>((event, emit) async {
    //   emit(state.copyWith(
    //       getFilteredProductStatus: FormzSubmissionStatus.inProgress));
    //   final result =
    //       await KatalogService.getFilteredProducts(event.categoryId, 10);
    //   if (result is List<ProductModel>) {
    //     emit(state.copyWith(
    //         filteredProductModel: result,
    //         getFilteredProductStatus: FormzSubmissionStatus.success));
    //   } else {
    //     emit(state.copyWith(
    //         getFilteredProductStatus: FormzSubmissionStatus.failure));
    //   }
    // });

    // on<PostBasketProductCategoryEvent>((event, emit) async {
    //   emit(state.copyWith(
    //       postResponseBasketStatus: FormzSubmissionStatus.inProgress));
    //   final result =
    //       await KatalogService.postBasketProducts(event.productVariationId);
    //   if (result is PostResponseBasketModel) {
    //     emit(state.copyWith(
    //         postResponseBasketModel: result,
    //         postResponseBasketStatus: FormzSubmissionStatus.success));
    //   } else {
    //     emit(state.copyWith(
    //         postResponseBasketStatus: FormzSubmissionStatus.failure));
    //   }
    // });
  
  }
}
