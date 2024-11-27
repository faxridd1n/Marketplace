import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/service/organization_service/organization_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/basket_model/post_basket_product_model.dart';
import '../../../models/products_model/product_model.dart';
part 'organization_event.dart';
part 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  OrganizationBloc() : super(const OrganizationState()) {
    on<GetAllProductsEvent>((event, emit) async {
      emit(state.copyWith(getProductStatus: FormzSubmissionStatus.inProgress));
      final result = await OrganizationService.getAllProducts(event.categoryId);
      if (result is List<ProductModel>) {
        emit(state.copyWith(productModel: result, getProductStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getProductStatus: FormzSubmissionStatus.failure));
      }
    });


    on<PostBasketProductSeeAllEvent>((event, emit) async {
      emit(state.copyWith(postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result = await OrganizationService.postBasketProducts(event.productVariationId);
      if (result is PostResponseBasketModel) {
        emit(state.copyWith(postResponseBasketModel: result, postResponseBasketStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(postResponseBasketStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
