import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';
import '../../models/home_model/category_model.dart';
import '../../models/products_model/product_model.dart';
import '../../models/profile_model/user_cards/general_response_model.dart';

class CategoryService {
  static final CategoryService _inheritance = CategoryService._init();

  static CategoryService get inheritance => _inheritance;

  CategoryService._init();

  static Future<CategoryModel?> getCategories() async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://arbuzmarket.com/api/v1/Categories");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        // final data = (response.data['item'] as List)
        //     .map((e) => CategoryModel.fromJson(e))
        //     .toList();
        final data = CategoryModel.fromJson(response.data);
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

  static Future<List<ProductModel>?> getFilteredProducts(
      int categoryId, int size) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
          "https://arbuzmarket.com/api/v1/Products/filters?size=$size",
          data: {
            "categoryId": categoryId,
            "size": size,
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
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0OTciLCJPcmdhbml6YXRpb25JZCI6IiIsIlVzZXJJZCI6IjQ5NyIsIkRldmljZUlkIjoiMTIyMSIsIlJvbGVJZCI6IjEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJ1c2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6Ijk5ODMzMDAyMDcwMCIsIm5iZiI6MTczMjI2NTk4NCwiZXhwIjoxNzMyODcwNzg0LCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.EgrlYd_q4TAfALdwPFVqwu9Tm2_ihz-_dm6HsdL25eg eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0OTciLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4MzMwMDIwNzAwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI0OTciLCJEZXZpY2VJZCI6IjEwNjIiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyNjIwODUzNiwiZXhwIjoxNzI2ODEzMzM2LCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.XZEsh8AzjUSFe6ZLlKGhNY8me0L9_vLFLLJ1sMAr4YY',
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
}
