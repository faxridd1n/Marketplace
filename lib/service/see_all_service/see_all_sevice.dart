import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/see_all_model/filtered_search_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';
import '../../components/hive/user_token.dart';
import '../../models/products_model/product_model.dart';
import '../../models/profile_model/user_cards/general_response_model.dart';

class SeeAllSevice {
  static final SeeAllSevice _inheritance = SeeAllSevice._init();

  static SeeAllSevice get inheritance => _inheritance;

  SeeAllSevice._init();

  static Future<List<ProductModel>?> getAllProducts(int categoryId) async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .post("https://arbuzmarket.com/api/v1/Products/filters", data: {
        "categoryId": categoryId,
      });
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        final data = (response.data['item'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        // final data = FilteredProductModel.fromJson(response.data);
        return data;
      } else {
        Log.e("${response.statusMessage} ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
    }

    return null;
  }

  static Future<GeneralResponseModel?> postBasketProducts(
      String productVariationId) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/basket",
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${userTokenBox.get('token')!.token.toString()}',
          },
        ),
        data: {"productVariationId": productVariationId, "count": 1},
      );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = GeneralResponseModel.fromJson(response.data);
        return data;
      } else {
        Log.e("${response.statusMessage} ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
    }

    return null;
  }

  static Future<List<FilteredSearchModel>?> getSearchFilters(
      GetProductParams queryParameters) async {
    try {
      final response = await DioConfig.inheritance.createRequest().get(
          "https://arbuzmarket.com/api/v1/Filters",
          queryParameters: queryParameters.toJson());
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        final data = (response.data['item'] as List)
            .map((e) => FilteredSearchModel.fromJson(e))
            .toList();
        // final data = FilteredProductModel.fromJson(response.data);
        return data;
      } else {
        Log.e("${response.statusMessage} ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
    }

    return null;
  }
}
