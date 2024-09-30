import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/product_detail_model/ProductDetailModel.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/service/home_service/home_service.dart';
import 'package:flutter_application_1/service/product_detail_service/product_detail_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/basket_model/PostBasketProductModel.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailState()) {
    on<GetProductDetailEvent>((event, emit) async {
      emit(state.copyWith(getDetailStatus: FormzSubmissionStatus.inProgress));
      final result = await HomeService.getProductDetail(event.productId);
      if (result is ProductDetailModel) {
        emit(state.copyWith(
            productDetailModel: result,
            getDetailStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getDetailStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetSimilarProductsEvent>((event, emit) async {
      emit(state.copyWith(getProductStatus: FormzSubmissionStatus.inProgress));
      final result =
          await ProductDetailService.getFilteredProducts(event.categoryId);
      if (result is List<ProductModel>) {
        emit(state.copyWith(
            parentCategoryModel: result,
            getProductStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getProductStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostBasketProductDetailEvent>((event, emit) async {
      emit(state.copyWith(
          postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result = await ProductDetailService.postBasketProducts(
          event.productVariationId);
      if (result is PostResponseBasketModel) {
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
