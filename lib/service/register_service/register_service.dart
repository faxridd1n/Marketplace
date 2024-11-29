import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/register_model/register_confirm_model/register_confirm_request_model.dart';
import 'package:flutter_application_1/models/register_model/register_confirm_model/register_confirm_response_model.dart';
import 'package:flutter_application_1/models/register_model/register_model/register_user_request_model.dart';
import 'package:flutter_application_1/models/register_model/register_model/register_user_response_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

class RegisterService {
  static final RegisterService _inheritance = RegisterService._init();

  static RegisterService get inheritance => _inheritance;

  RegisterService._init();

  static Future<RegisterUserResponseModel?> registerUser(
      RegisterUserRequestModel userModel) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/Auth/register",
        // options: Options(
        //   headers: {
        //     'Authorization':
        //         userTokenBox.get('token')!.token.toString(),
        //   },
        // ),
        data: {
          // "firstname": "Faxriddin",
          // "lastname": "Ruzikulov",
          // "middlename": "Dilmurad ogli",
          // "passportSerial": "AC",
          // "passportNumber": "2811688",
          // "birthDate": "2004-03-13 00:00:00.000",
          // "phoneNumber": "998938690898",
          // "password": "faxriddin111",
          // "confirmPassword": "faxriddin111",
          // "passportType": 1

          "firstname": userModel.firstname,
          "lastname": userModel.lastname,
          "middlename": userModel.middlename,
          "passportSerial": userModel.passportSerial,
          "passportNumber": userModel.passportNumber,
          "birthDate": userModel.birthDate,
          "phoneNumber": userModel.phoneNumber,
          "password": userModel.password,
          "confirmPassword": userModel.confirmPassword,
          "passportType": userModel.passportType
        },
      );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = RegisterUserResponseModel.fromJson(response.data);
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

  static Future<RegisterConfirmResponseModel?> registerConfirm(
      RegisterConfirmRequestModel userRequestModel) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/Auth/register/confirm",
        // options: Options(
        //   headers: {
        //     'Authorization':
        //         userTokenBox.get('token')!.token.toString(),
        //   },
        // ),
        data: {
          "clientId": userRequestModel.clientId,
          "otp": userRequestModel.otp,
          "deviceId": "string",
          "deviceType": 0
        },
      );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = RegisterConfirmResponseModel.fromJson(response.data);
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
