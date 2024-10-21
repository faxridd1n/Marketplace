import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/basket_model/post_basket_product_model.dart';
import 'package:flutter_application_1/service/katalog_service/katalog_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/products_model/product_model.dart';

part 'katalog_event.dart';
part 'katalog_state.dart';

class KatalogBloc extends Bloc<KatalogEvent, KatalogState> {
  KatalogBloc() : super(const KatalogState()) {



    on<GetKatalogEvent>((event, emit) async {
      emit(state.copyWith(getFilteredProductStatus: FormzSubmissionStatus.inProgress));
      final result = await KatalogService.getFilteredProducts(event.categoryId,10);
      if (result is List<ProductModel>) {
        emit(state.copyWith(filteredProductModel: result, getFilteredProductStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getFilteredProductStatus: FormzSubmissionStatus.failure));
      }
    });


    on<PostBasketProductKatalogEvent>((event, emit) async {
      emit(state.copyWith(
          postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result =
          await KatalogService.postBasketProducts(event.productVariationId);
      if (result is PostResponseBasketModel) {
        emit(state.copyWith(
            postResponseBasketModel: result,
            postResponseBasketStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            postResponseBasketStatus: FormzSubmissionStatus.failure));
      }
    });





// on<FetchNextPage>((event, emit)async {
//   emit(state.copyWith(getFilteredProductStatus: FormzSubmissionStatus.inProgress));
//   var res=await KatalogService.getFilteredProducts(event.categoryId,event.page);
//   if (res is List<ParentCategoryModel>) {
//         emit(state.copyWith(filteredProductModel: res, getFilteredProductStatus: FormzSubmissionStatus.success,));
//       } else {
//         emit(state.copyWith(getFilteredProductStatus: FormzSubmissionStatus.failure));
//       }
// },);


  }
}
