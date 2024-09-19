import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/OrganizationContactModel.dart';
import 'package:flutter_application_1/models/home_model/OrganizationModel.dart';
import 'package:flutter_application_1/models/product_detail_model/ProductDetailModel.dart';
import 'package:flutter_application_1/models/home_model/CategoryModel.dart';
import 'package:flutter_application_1/models/tabs_model/tabs_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

import '../../models/basket_model/PostBasketProductModel.dart';
import '../../models/products_model/product_model.dart';

class HomeService {
  static final HomeService _inheritance = HomeService._init();

  static HomeService get inheritance => _inheritance;

  HomeService._init();

  static Future<List<ProductModel>?> getProducts(int tab) async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/v1/Products?size=5&page=1&tab=${tab}");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());
      print(response.data);

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

  static Future<ProductDetailModel?> getProductDetail(String id) async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/v1/Products/${id}");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());
      print(response.data);

      if (response.statusCode == 200) {
        Log.i(response.data.toString());
        Log.i(response.statusCode.toString());
        print(response.data);
        // final data = (response.data['item'] as List)
        //     .map((e) => ParentCategoryModel.fromJson(e))
        //     .toList();
        final data = ProductDetailModel.fromJson(response.data);

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

  static Future<OrganizationContactModel?> getOrganizationContact(
      int organizationId) async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/Organizations/${9}/contact");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());
      print(response.data);

      if (response.statusCode == 200) {
        Log.i(response.data.toString());
        Log.i(response.statusCode.toString());
        print(response.data);
        // final data = (response.data['item'] as List)
        //     .map((e) => ParentCategoryModel.fromJson(e))
        //     .toList();
        final data = OrganizationContactModel.fromJson(response.data);

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

  static Future<List<OrganizationModel>?> getOrganizations() async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/Organizations");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());
      print(response.data);

      if (response.statusCode == 200) {
        Log.i(response.data.toString());
        Log.i(response.statusCode.toString());
        print(response.data);
        final data = (response.data as List)
            .map((e) => OrganizationModel.fromJson(e))
            .toList();
        // final data = OrganizationContactModel.fromJson(response.data);

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

  static Future<CategoryModel?> getCategories() async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/v1/Categories");
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

  static Future<List<ProductModel>?> getFilteredProducts(int categoryId) async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .post("https://m.taqsim.uz/api/v1/Products/filters", data: {
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

  static Future<PostResponseBasketModel?> postBasketProducts(
      String productVariationId, int count) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://c.taqsim.uz/api/Basket",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0OTciLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4MzMwMDIwNzAwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI0OTciLCJEZXZpY2VJZCI6IjEwNjIiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyNjIwODUzNiwiZXhwIjoxNzI2ODEzMzM2LCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.XZEsh8AzjUSFe6ZLlKGhNY8me0L9_vLFLLJ1sMAr4YY',
          },
        ),
        data: {"productVariationId": productVariationId, "count": count},
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

  static Future<TabsModel?> getTabs() async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/Tabs");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        // final data = (response.data['item'] as List)
        //     .map((e) => TabsModel.fromJson(e))
        //     .toList();
        final data = TabsModel.fromJson(response.data);
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
