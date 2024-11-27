import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/login_model/post_login_response_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

import '../../components/hive/user_token.dart';
//Login servicedagi narsala auth serviceda yozilgan,ushatta login service ishlatilvotti
class LoginService {
  static final LoginService _inheritance = LoginService._init();

  static LoginService get inheritance => _inheritance;

  LoginService._init();

  static Future<PostLoginResponseModel?> postLoginUser(String phoneNumber) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/Auth",
        options: Options(
          headers: {
            'Authorization':
                userTokenBox.getAt(0)!.token.toString(),
          },
        ),
        data: {
          "phoneNumber": phoneNumber,
          "displayName": "string",
          "deviceId": "string",
        },
      );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = PostLoginResponseModel.fromJson(response.data);
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
