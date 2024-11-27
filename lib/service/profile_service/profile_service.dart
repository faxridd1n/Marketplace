import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/profile_model/user_orders_model.dart';
import 'package:flutter_application_1/models/profile_model/user_profile_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';
import '../../components/hive/user_token.dart';

class ProfileService {
  static final ProfileService _inheritance = ProfileService._init();

  static ProfileService get inheritance => _inheritance;

  ProfileService._init();

  static Future<UserProfileModel?> getUserProfile() async {
    try {
      final response = await DioConfig.inheritance.createRequest().get(
            "https://client.arbuzmarket.com/api/profile",
            options: Options(
              headers: {
                'Authorization': 'Bearer ${userTokenBox.get('token')!.token.toString()}',
              },
            ),
          );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = UserProfileModel.fromJson(response.data);
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

  static Future<UserOrdersModel?> getUserOrders() async {
    try {
      final response = await DioConfig.inheritance.createRequest().get(
            "https://client.arbuzmarket.com/api/orders/m",
            options: Options(
              headers: {
                'Authorization': userTokenBox.getAt(0)!.token.toString(),
              },
            ),
          );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
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

  static Future<UserProfileModel?> editUserInfo(
      String firstname, String lastname) async {
    try {
      final response = await DioConfig.inheritance.createRequest().put(
        "https://client.arbuzmarket.com/api/profile/client-info",
        options: Options(
          headers: {
            'Authorization': userTokenBox.getAt(0)!.token.toString(),
          },
        ),
        data: {
          "firstname": firstname,
          "lastname": lastname,
        },
      );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = UserProfileModel.fromJson(response.data);
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
