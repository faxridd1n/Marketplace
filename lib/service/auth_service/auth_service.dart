import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/auth_model/register_confirm_request_model.dart';
import 'package:flutter_application_1/models/auth_model/register_confirm_response_model.dart';
import 'package:flutter_application_1/models/auth_model/register_user_request_model.dart';
import 'package:flutter_application_1/models/auth_model/register_user_response_model.dart';
import 'package:flutter_application_1/models/user_model/user_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

class AuthService {
  static final AuthService _inheritance = AuthService._init();

  static AuthService get inheritance => _inheritance;

  AuthService._init();

  static Future<AuthModel?> postAuthUser(String phoneNumber) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/Auth",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIcciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0OTciLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4MzMwMDIwNzAwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI0OTciLCJEZXZpY2VJZCI6IjExMzAiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODA0NjMyOCwiZXhwIjoxNzI4NjUxMTI4LCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.kqk8tfADgSAXuM6EiSWTzk4ywhV7RhfLLFpgczPLSDM',
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
        final data = AuthModel.fromJson(response.data);
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

  static Future<RegisterUserResponseModel?> registerUser(
      RegisterUserModel userModel) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/Auth/register",
        // options: Options(
        //   headers: {
        //     'Authorization':
        //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc',
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
      RegisterConfirmRequestModel userModel) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/Auth/register/confirm",
        // options: Options(
        //   headers: {
        //     'Authorization':
        //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc',
        //   },
        // ),
        data: {
          "clientId": userModel.clientId,
          "otp": userModel.otp,
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
