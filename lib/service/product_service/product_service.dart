import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/product_detail_model/product_detail_model.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';
import '../../components/hive/user_token.dart';

import '../../models/basket_model/post_basket_product_model.dart';
import '../../models/product_detail_model/organization_contact_model.dart';

class ProductService {
  static final ProductService _inheritance = ProductService._init();

  static ProductService get inheritance => _inheritance;

  ProductService._init();

  static Future<List<ProductModel>?> getProducts(GetProductParams params) async {
    try {
      final response = await DioConfig.inheritance.createRequest().get(
        "https://arbuzmarket.com/api/v1/Products",
        queryParameters: params.toJson(),
      );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = (response.data['item'] as List).map((e) => ProductModel.fromJson(e)).toList();

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
          .get("https://arbuzmarket.com/api/v1/Products/$id");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        Log.i(response.data.toString());
        Log.i(response.statusCode.toString());
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


  static Future<List<ProductModel>?> getFilteredProducts(int categoryId) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
          "https://arbuzmarket.com/api/v1/Products/filters",
          data: {"categoryId": categoryId, "size": 5});
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

  static Future<OrganizationContactModel?> getOrganizationContact(
      int organizationId) async {
    try {
      final response = await DioConfig.inheritance.createRequest().get(
          "https://arbuzmarket.com/api/Organizations/9/contact");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        Log.i(response.data.toString());
        Log.i(response.statusCode.toString());
        
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
}
