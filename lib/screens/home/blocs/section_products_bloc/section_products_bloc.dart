import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/service/product_service/product_service.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../../models/see_all_model/filtered_search_model.dart';
import '../../../../service/see_all_service/see_all_sevice.dart';

part 'section_products_event.dart';

part 'section_products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsState()) {
    on<GetProductsEvent>((event, emit) async {
      emit(state.copyWith(getProductsStatus: FormzSubmissionStatus.inProgress));
      final result = await ProductService.getProducts(GetProductParams(
        sectionId: state.sectionId,
        categoryId: state.categoryId,
        page: event.page,
        size: event.size,
      ));
      if (result is List<ProductModel>) {
        emit(
          state.copyWith(
            products: result,
            getProductsStatus: FormzSubmissionStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            getProductsStatus: FormzSubmissionStatus.failure,
          ),
        );
      }
    });

    on<GetFilteredProductsEvent>((event, emit) async {
      emit(state.copyWith(
          filteredProductStatus: FormzSubmissionStatus.inProgress));
      final result = await ProductService.getFilteredProducts(
        event.sectionId,
        event.categoryId,
        event.page,
        event.size,
      );
      if (result is List<ProductModel>) {
        emit(
          state.copyWith(
            filteredProducts: result,
            filteredProductStatus: FormzSubmissionStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            filteredProductStatus: FormzSubmissionStatus.failure,
          ),
        );
      }
    });

    on<GetSimilarProductsEvent>((event, emit) async {
      emit(state.copyWith(getProductsStatus: FormzSubmissionStatus.inProgress));
      final result = await ProductService.getSimilarProducts(
        event.categoryId,
        event.size,
      );
      if (result is List<ProductModel>) {
        emit(
          state.copyWith(
            products: result,
            getProductsStatus: FormzSubmissionStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            getProductsStatus: FormzSubmissionStatus.failure,
          ),
        );
      }
    });

    on<SetSectionIdEvent>((event, emit) async {
      emit(state.copyWith(sectionId: int.parse(event.sectionId)));
      add(GetProductsEvent(event.size, event.page));
    });

    on<SetCategoryIdEvent>((event, emit) async {
      emit(state.copyWith(categoryId: event.categoryId));
      add(GetSimilarProductsEvent(
        event.categoryId,
        event.size,
      ));
    });

    on<GetSearchFiltersEvent>((event, emit) async {
      emit(state.copyWith(
          getFilteredSerchStatus: FormzSubmissionStatus.inProgress));
      final result = await SeeAllSevice.getSearchFilters(GetProductParams(
        sectionId: state.sectionId,
        categoryId: state.categoryId,
      ));
      if (result is FilteredSearchModel) {
        emit(state.copyWith(
            filteredSearchModel: result,
            getFilteredSerchStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(
            getFilteredSerchStatus: FormzSubmissionStatus.failure));
      }
    });

    // on<PostBasketProductEvent>((event, emit) async {
    //   emit(state.copyWith(
    //       postResponseBasketStatus: FormzSubmissionStatus.inProgress));
    //   final result =
    //       await SeeAllSevice.postBasketProducts(event.productVariationId);
    //   if (result is GeneralResponseModel) {
    //     emit(state.copyWith(
    //         postResponseBasketModel: result,
    //         postResponseBasketStatus: FormzSubmissionStatus.success));
    //   } else {
    //     emit(state.copyWith(
    //         postResponseBasketStatus: FormzSubmissionStatus.failure));
    //   }
    // });

    // on<GetBasketProductEvent>((event, emit) async {
    //   emit(state.copyWith(
    //       getBasketProductStatus: FormzSubmissionStatus.inProgress));
    //   final result = await BasketService.getBasketProducts();
    //   if (result is BasketProductModel) {
    //     emit(
    //       state.copyWith(
    //         basketProductModel: result,
    //         getBasketProductStatus: FormzSubmissionStatus.success,
    //       ),
    //     );
    //   } else {
    //     emit(
    //       state.copyWith(
    //         getBasketProductStatus: FormzSubmissionStatus.failure,
    //       ),
    //     );
    //   }
    // });
  }
}
