import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/home_model/organization_model.dart';
import 'package:flutter_application_1/models/product_detail_model/product_detail_model.dart';
import 'package:flutter_application_1/models/home_model/category_model.dart';
import 'package:flutter_application_1/models/tabs_model/tabs_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';
import '../../models/basket_model/post_basket_product_model.dart';
import '../../models/products_model/product_model.dart';
import '../../components/hive/user_token.dart';

class HomeService {
  static final HomeService _inheritance = HomeService._init();

  static HomeService get inheritance => _inheritance;

  HomeService._init();

  static Future<List<ProductModel>?> getProducts(int tab) async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://arbuzmarket.com/api/v1/Products?size=5&page=1&tab=${tab}");
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
          .get("https://arbuzmarket.com/api/v1/Products/${id}");
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

  

  static Future<List<OrganizationModel>?> getOrganizations() async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://arbuzmarket.com/api/Organizations");
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

  static Future<List<ProductModel>?> getFilteredProducts(int categoryId) async {
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

  static Future<PostResponseBasketModel?> postBasketProducts(
      String productVariationId, int count) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/basket",
        options: Options(
          headers: {
            'Authorization':
               'Bearer ${userTokenBox.get('token')!.token.toString()}',
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
          .get("https://arbuzmarket.com/api/Tabs");
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
