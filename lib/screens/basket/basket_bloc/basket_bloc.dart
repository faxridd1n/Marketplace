import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/basket_model/basket_product_model.dart';
import 'package:flutter_application_1/models/product_detail_model/organization_contact_model.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/general_response_model.dart';
import 'package:flutter_application_1/service/basket_service/basket_service.dart';
import 'package:flutter_application_1/service/product_service/product_service.dart';
import 'package:formz/formz.dart';


part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(const BasketState()) {
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

    on<GetOrganizationEvent>((event, emit) async {
      emit(state.copyWith(
          organizationContactStatus: FormzSubmissionStatus.inProgress));
      final result =
          await ProductService.getOrganizationContact(event.organizationId);
      if (result is OrganizationContactModel) {
        emit(state.copyWith(
            organizationContactModel: result,
            organizationContactStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            organizationContactStatus: FormzSubmissionStatus.failure));
      }
    });

    on<DeleteBasketProductsEvent>((event, emit) async {
      emit(state.copyWith(
        basketDeleteResStatus: FormzSubmissionStatus.inProgress,
      ));
      final result =
          await BasketService.deleteBasketProducts(event.productVariationId);
      if (result is GeneralResponseModel) {
        emit(state.copyWith(
          basketDeleteResModel: result,
          basketDeleteResStatus: FormzSubmissionStatus.success,
        ));
        add(GetBasketProductsEvent());
      } else {
        emit(state.copyWith(
          basketDeleteResStatus: FormzSubmissionStatus.failure,
        ));
      }
    });

    on<DeleteAllBasketProductsEvent>((event, emit) async {
      emit(state.copyWith(
          deleteBasketAllResponseStatus: FormzSubmissionStatus.inProgress));
      final result = await BasketService.deleteBasketAllProducts(
          event.productsVariationId);
      if (result is GeneralResponseModel) {
        emit(state.copyWith(
            deleteBasketAllResponseModel: result,
            deleteBasketAllResponseStatus: FormzSubmissionStatus.success));
        add(GetBasketProductsEvent());
      } else {
        emit(state.copyWith(
            deleteBasketAllResponseStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostBasketProductCountBasketEvent>((event, emit) async {
      emit(state.copyWith(
          postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result = await BasketService.postBasketProducts(
          event.productVariationId!, event.count!);
      if (result is GeneralResponseModel) {
        emit(state.copyWith(
            postResponseBasketModel: result,
            postResponseBasketStatus: FormzSubmissionStatus.success));
        add(GetBasketProductsEvent());
      } else {
        emit(state.copyWith(
            postResponseBasketStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostBasketProductBasketEvent>((event, emit) async {
      emit(state.copyWith(
          postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result = await BasketService.postBasketProducts(
          event.productVariationId, event.count);
      if (result is GeneralResponseModel) {
        emit(state.copyWith(
            postResponseBasketModel: result,
            postResponseBasketStatus: FormzSubmissionStatus.success));
        add(GetBasketProductsEvent());
      } else {
        emit(state.copyWith(
            postResponseBasketStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
