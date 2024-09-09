import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/home_model/OrganizationModel.dart';
import 'package:flutter_application_1/models/home_model/CategoryModel.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/service/home_service/home_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../models/basket_model/PostBasketProductModel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetProductEvent>((event, emit) async {
      emit(state.copyWith(getProductStatus: FormzSubmissionStatus.inProgress));
      final result = await HomeService.getProducts();
      if (result is List<ProductModel>) {
        emit(state.copyWith(
            parentCategoryModel: result,
            getProductStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getProductStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetCategoriesEvent>((event, emit) async {
      emit(state.copyWith(getProductStatus: FormzSubmissionStatus.inProgress));
      final result = await HomeService.getCategories();
      if (result is CategoryModel) {
        emit(state.copyWith(
            categoryModel: result,
            getCategoryStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(getProductStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetOrganizationsEvent>((event, emit) async {
      emit(state.copyWith(
          getOrganizationStatus: FormzSubmissionStatus.inProgress));
      final result = await HomeService.getOrganizations();
      if (result is List<OrganizationModel>) {
        emit(state.copyWith(
            organizationModel: result,
            getOrganizationStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            getOrganizationStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PostBasketProductHomeEvent>((event, emit) async {
      emit(state.copyWith(
          postResponseBasketStatus: FormzSubmissionStatus.inProgress));
      final result =
          await HomeService.postBasketProducts(event.productVariationId,event.count);
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
