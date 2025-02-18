import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/product_detail_model/organization_contact_model.dart';
import 'package:flutter_application_1/models/product_detail_model/product_detail_model.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/models/review_models/post_review_request_model.dart';
import 'package:flutter_application_1/models/review_models/products_get_review_response_model.dart';
import 'package:flutter_application_1/service/product_service/product_service.dart';
import 'package:flutter_application_1/service/review_service/products_review_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/profile_model/user_cards/general_response_model.dart';
part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailState()) {
    on<GetProductDetailEvent>((event, emit) async {
      emit(state.copyWith(getDetailStatus: FormzSubmissionStatus.inProgress));
      final result = await ProductService.getProductDetail(event.productId);
      if (result is ProductDetailModel) {
        emit(state.copyWith(
            productDetailModel: result,
            getDetailStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getDetailStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetProductsReviewEvent>((event, emit) async {
      emit(state.copyWith(
          getProductsReviewResponseStatus: FormzSubmissionStatus.inProgress));
      final result = await ProductsReviewService.getProductsReview(
        GetProductParams(
          forId: event.forId,
        ),
      );
      if (result is ProductsGetReviewResponseModel) {
        emit(state.copyWith(
          productsGetReviewResponseModel: result,
          getProductsReviewResponseStatus: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(
            getProductsReviewResponseStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostProductsReviewEvent>((event, emit) async {
      emit(state.copyWith(
          postReviewResponseStatus: FormzSubmissionStatus.inProgress));
      final result = await ProductsReviewService.postProductReview(
        event.postReviewRequestModel,
      );
      if (result is GeneralResponseModel) {
        emit(state.copyWith(
          postReviewResponseModel: result,
          postReviewResponseStatus: FormzSubmissionStatus.success,
        ));
        add(GetProductsReviewEvent(forId: event.forId));
      } else {
        emit(state.copyWith(
            postReviewResponseStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostBasketProductDetailEvent>((event, emit) async {
      emit(state.copyWith(
          postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result =
          await ProductService.postBasketProducts(event.productVariationId);
      if (result is GeneralResponseModel) {
        emit(state.copyWith(
            postResponseBasketModel: result,
            postResponseBasketStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            postResponseBasketStatus: FormzSubmissionStatus.failure));
      }
    });

    

    on<GetOrganizationContactEvent>((event, emit) async {
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
            organizationContactModel: result,
            organizationContactStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
