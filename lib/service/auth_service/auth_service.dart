import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/login_model/post_login_response_model.dart';
import 'package:flutter_application_1/models/login_model/put_login_otp_response_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

class AuthService {
  static final AuthService _inheritance = AuthService._init();

  static AuthService get inheritance => _inheritance;

  AuthService._init();

  static Future<PostLoginResponseModel?> postLoginUser(
      String phoneNumber) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/Auth",
        data: {
          "phoneNumber": phoneNumber,
          "displayName": "string",
          "deviceId": "string",
        },
      );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
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

  static Future<PutLoginOtpResponseModel?> putOTP(
      String phoneNumber, String otp) async {
    try {
      final response = await DioConfig.inheritance.createRequest().put(
        "https://client.arbuzmarket.com/api/Auth",
        data: {
          "deviceType": 0,
          "deviceId": "string",
          "displayName": "string",
          "userType": 0,
          "imei": "string",
          "ip": "string",
          "otp": otp,
          "isTrusted": true,
          "firebaseToken": "string",
          "userRoleId": 0,
          "phoneNumber": phoneNumber,
        },
      );
      Log.e("${response.statusMessage} ${response.statusCode}");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = PutLoginOtpResponseModel.fromJson(response.data);
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
