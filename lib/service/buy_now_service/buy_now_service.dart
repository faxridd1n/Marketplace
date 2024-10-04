import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/buy_now_model/location_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

class BuyNowService {
  static final BuyNowService _inheritance = BuyNowService._init();

  static BuyNowService get inheritance => _inheritance;

  BuyNowService._init();

  static Future<LocationModel?> getRegions() async {
    try {
      final response = await DioConfig.inheritance.createRequest().get(
            "https://c.taqsim.uz/api/regions",
            options: Options(
              headers: {
               'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0OTciLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4MzMwMDIwNzAwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI0OTciLCJEZXZpY2VJZCI6IjExMzAiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODA0NjMyOCwiZXhwIjoxNzI4NjUxMTI4LCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.kqk8tfADgSAXuM6EiSWTzk4ywhV7RhfLLFpgczPLSDM',
         },
            ),
          );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        // final data = (response.data['result'] as List)
        //     .map((e) => RegionsModel.fromJson(e))
        //     .toList();
        final data = LocationModel.fromJson(response.data);
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


 static Future<LocationModel?> getDistricts(int regionId) async {
    try {
      final response = await DioConfig.inheritance.createRequest().get(
            "https://c.taqsim.uz/api/regions/${regionId}/districts",
            options: Options(
              headers: {
                'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0OTciLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTk4MzMwMDIwNzAwIiwiT3JnYW5pemF0aW9uSWQiOiIiLCJVc2VySWQiOiI0OTciLCJEZXZpY2VJZCI6IjExMzAiLCJSb2xlSWQiOiIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoidXNlciIsIm5iZiI6MTcyODA0NjMyOCwiZXhwIjoxNzI4NjUxMTI4LCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.kqk8tfADgSAXuM6EiSWTzk4ywhV7RhfLLFpgczPLSDM',
          },
            ),
          );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode == 200) {
        // final data = (response.data['result'] as List)
        //     .map((e) => RegionsModel.fromJson(e))
        //     .toList();
        final data = LocationModel.fromJson(response.data);
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
