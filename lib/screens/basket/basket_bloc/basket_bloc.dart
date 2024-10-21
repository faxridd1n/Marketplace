import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/basket_model/basket_delete_res_model.dart';
import 'package:flutter_application_1/models/basket_model/basket_product_model.dart';
import 'package:flutter_application_1/service/basket_service/basket_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/basket_model/post_basket_product_model.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketState()) {
    on<GetBasketProductsEvent>((event, emit) async {
      emit(state.copyWith(
        getBasketProductStatus: FormzSubmissionStatus.inProgress,
      ));
      final result = await BasketService.getBasketProducts();
      if (result is BasketProductModel) {
        emit(state.copyWith(
          basketResponseModel: result,
          getBasketProductStatus: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(
          getBasketProductStatus: FormzSubmissionStatus.failure,
        ));
      }
    });

    on<DeleteBasketProductsEvent>((event, emit) async {
      emit(state.copyWith(
        basketDeleteResStatus: FormzSubmissionStatus.inProgress,
      ));
      final result =
          await BasketService.deleteBasketProducts(event.productVariationId);
      if (result is BasketDeleteResModel) {
        emit(state.copyWith(
          basketDeleteResModel: result,
          basketDeleteResStatus: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(
          basketDeleteResStatus: FormzSubmissionStatus.failure,
        ));
      }
    });

    on<PostBasketProductCountBasketEvent>((event, emit) async {
      emit(state.copyWith(
          postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result = await BasketService.postBasketProducts(
          event.productVariationId!, event.count!);
      if (result is PostResponseBasketModel) {
        emit(state.copyWith(
            postResponseBasketModel: result,
            postResponseBasketStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            postResponseBasketStatus: FormzSubmissionStatus.failure));
      }
    });

    on<SelectBasketProductsEvent>((event, emit) {
      final updatedList =
          List<ProductElement>.from(state.selectedProducts as Iterable)
            ..add(event.selectedProducts);
      emit(state.copyWith(selectedProducts: updatedList));
    });

    on<PostBasketProductBasketEvent>((event, emit) async {
      emit(state.copyWith(
          postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result = await BasketService.postBasketProducts(
          event.productVariationId, event.count);
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
