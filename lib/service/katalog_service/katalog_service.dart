import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

import '../../models/basket_model/PostBasketProductModel.dart';
import '../../models/products_model/product_model.dart';

class KatalogService {
  static final KatalogService _inheritance = KatalogService._init();

  static KatalogService get inheritance => _inheritance;

  KatalogService._init();

  static Future<List<ProductModel>?> getFilteredProducts(
      int categoryId, int size) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
          "https://m.taqsim.uz/api/v1/Products/filters?size=$size",
          data: {
            "categoryId": categoryId,
            "size":size,
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


  static Future<PostResponseBasketModel?> postBasketProducts(
      String productVariationId) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://c.taqsim.uz/api/Basket",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0OTciLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4MzMwMDIwNzAwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI0OTciLCJEZXZpY2VJZCI6IjEwNDIiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyNTQ1Nzk0MSwiZXhwIjoxNzI2MDYyNzQxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.ioxiakBO-sNvldjiHzjcjbBEcj_Zu6j9b1VVDkYgw3s',
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
        final data = PostResponseBasketModel.fromJson(response.data);
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
