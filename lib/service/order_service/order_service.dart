import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
// import 'package:flutter_application_1/models/order_model/post_order_response_model.dart';
import 'package:flutter_application_1/models/order_model/user_orders_model.dart';
// import 'package:flutter_application_1/screens/profile/profile_bloc/profile_page_bloc/profile_bloc.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';
import '../../components/hive/user_token.dart';
import '../../models/order_model/post_order_request_model.dart';

class OrderService {
  static final OrderService _inheritance = OrderService._init();

  static OrderService get inheritance => _inheritance;

  OrderService._init();

  // static Future<UserOrdersModel?> getUserOrders() async {
  //   try {
  //     final response = await DioConfig.inheritance.createRequest().get(
  //           "https://client.arbuzmarket.com/api/orders/m",
  //           options: Options(
  //             headers: {
  //               'Authorization':
  //                   'Bearer ${userTokenBox.get('token')!.token.toString()}',
  //             },
  //           ),
  //         );
  //     Log.i(response.data.toString());
  //     Log.i(response.statusCode.toString());

  //     if (response.statusCode == 200) {
  //       // final data = (response.data['item'] as List)
  //       //     .map((e) => BasketProductModel.fromJson(e))
  //       //     .toList();
  //       final data = UserOrdersModel.fromJson(response.data);
  //       return data;
  //     } else {
  //       Log.e("${response.statusMessage} ${response.statusCode}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       Log.e(e.response!.toString());
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //   }

  //   return null;
  // }

  static Future<UserOrdersModel?> postUserOrders(
      PostOrderRequestModel requestModel) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/orders/m/filter",
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${userTokenBox.get('token')!.token.toString()}',
          },
        ),
        data: {
          "page": 1,
          "subOrderState": [0, 1, 2, 5],
        },
        // requestModel.toJson(),
      );
      //  requestModel
      //         {
      //   "paymentType": requestModel.paymentType,
      //   "deliveryType": requestModel.deliveryType,
      //   "regionId": requestModel.regionId,
      //   "destrictId": requestModel.destrictId,
      //   "address": requestModel.address,
      //   "comment": requestModel.comment,
      //   "items": requestModel.items,
      // }

      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = UserOrdersModel.fromJson(response.data);
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

  static Future<UserOrdersModel?> postUserFinishedOrders(
      PostOrderRequestModel requestModel) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/orders/m/filter",
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${userTokenBox.get('token')!.token.toString()}',
          },
        ),
        data: {
          "page": 1,
          "subOrderState": [3, 4],
        },
        // requestModel.toJson(),
      );
      //  requestModel
      //         {
      //   "paymentType": requestModel.paymentType,
      //   "deliveryType": requestModel.deliveryType,
      //   "regionId": requestModel.regionId,
      //   "destrictId": requestModel.destrictId,
      //   "address": requestModel.address,
      //   "comment": requestModel.comment,
      //   "items": requestModel.items,
      // }

      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = UserOrdersModel.fromJson(response.data);
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
