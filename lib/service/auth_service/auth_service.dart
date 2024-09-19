import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/user_model/user_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

class BasketService {
  static final BasketService _inheritance = BasketService._init();

  static BasketService get inheritance => _inheritance;

  BasketService._init();

  static Future<UserModel?> postBasketProducts(
      String productVariationId,int count) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://c.taqsim.uz/api/Auth",
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
        final data = UserModel.fromJson(response.data);
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
