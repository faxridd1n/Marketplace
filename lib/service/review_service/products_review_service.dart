import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/general_response_model.dart';
import 'package:flutter_application_1/models/review_models/post_review_request_model.dart';
import 'package:flutter_application_1/models/review_models/products_get_review_response_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

import '../../components/hive/user_token.dart';

class ProductsReviewService {
  static final ProductsReviewService _inheritance =
      ProductsReviewService._init();

  static ProductsReviewService get inheritance => _inheritance;

  ProductsReviewService._init();

  static Future<ProductsGetReviewResponseModel?> getProductsReview(
      GetProductParams params) async {
    try {
      final response = await DioConfig.inheritance.createRequest().get(
            "https://client.arbuzmarket.com/api/Reviews/products",
            options: Options(
              headers: {
                'Authorization':
                    'Bearer ${userTokenBox.get('token')!.token.toString()}',
              },
            ),
            queryParameters: params.toJson(),
          );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = ProductsGetReviewResponseModel.fromJson(response.data);
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

  static Future<GeneralResponseModel?> postProductReview(
      PostReviewRequestModel postReviewRequestModel) async {
    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .post("https://client.arbuzmarket.com/api/Reviews/products",
              options: Options(
                headers: {
                  'Authorization':
                      'Bearer ${userTokenBox.get('token')!.token.toString()}',
                },
              ),
              data: {
            "content": postReviewRequestModel.content,
            "forId": postReviewRequestModel.forId,
            "isAnonymous": postReviewRequestModel.isAnonymous,
            "rating": postReviewRequestModel.rating,
          });
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
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
