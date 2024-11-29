import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/buy_now_model/location_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';
import '../../components/hive/user_token.dart';

class BuyNowService {
  static final BuyNowService _inheritance = BuyNowService._init();

  static BuyNowService get inheritance => _inheritance;

  BuyNowService._init();

  static Future<LocationModel?> getRegions() async {
    try {
      final response = await DioConfig.inheritance.createRequest().get(
            "https://client.arbuzmarket.com/api/regions",
            options: Options(
              headers: {
                'Authorization':
                    'Bearer ${userTokenBox.get('token')!.token.toString()}',
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
            "https://client.arbuzmarket.com/api/regions/${regionId}/districts",
            options: Options(
              headers: {
                'Authorization': 'Bearer ${userTokenBox.get('token')!.token.toString()}',
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
