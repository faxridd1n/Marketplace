import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/profile_model/user_profile_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

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
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4OTAzOTM4NjUwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI2MzAiLCJEZXZpY2VJZCI6IjExNTMiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODkwODA3MSwiZXhwIjoxNzI5NTEyODcxLCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.-t9rrZZoX1crwRQpbeOTve1oMJr2AJiOGTiSYECNMIc',
          },
        ),
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
