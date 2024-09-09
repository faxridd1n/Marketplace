import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

class ProductDetailService {
  static final ProductDetailService _inheritance = ProductDetailService._init();

  static ProductDetailService get inheritance => _inheritance;

  ProductDetailService._init();

  static Future<List<ProductModel>?> getProducts() async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/v1/Products?size=10&page=1&tab=34");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        final data = (response.data['item'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();

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

  static Future<List<ProductModel>?> getFilteredProducts(int categoryId) async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .post("https://m.taqsim.uz/api/v1/Products/filters", data: {
        "categoryId": categoryId,
        "size":5
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
}
