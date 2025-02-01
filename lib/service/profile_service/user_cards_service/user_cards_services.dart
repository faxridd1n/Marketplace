import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/get_user_cards_response_model.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/post_user_add_card_confirm_response_model.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/post_user_card_response_model.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/general_response_model.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/request_models/post_user_add_card_request_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';
import '../../../components/hive/user_token.dart';

class UserCardsServices {
  static final UserCardsServices _inheritance = UserCardsServices._init();

  static UserCardsServices get inheritance => _inheritance;

  UserCardsServices._init();

  static Future<GetUserCardsResponseModel?> getUserCards() async {
    try {
      final response = await DioConfig.inheritance.createRequest().get(
            "https://client.arbuzmarket.com/api/cards",
            options: Options(
              headers: {
                'Authorization':
                    'Bearer ${userTokenBox.get('token')!.token.toString()}',
              },
            ),
          );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = GetUserCardsResponseModel.fromJson(response.data);
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

  static Future<PostUserCardResponseModel?> postUserCards(
      PostUserAddCardRequestModel requestModel) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/cards",
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${userTokenBox.get('token')!.token.toString()}',
          },
        ),
        data: {
          "cardName": requestModel.cardName,
          "cardNumber": requestModel.cardNumber,
          "expire": requestModel.expire,
          "expireMonth": requestModel.expireMonth,
          "expireYear": requestModel.expireYear
        },
      );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = PostUserCardResponseModel.fromJson(response.data);
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

  static Future<PostUserAddCardConfirmResponseModel?> postUserAddCardConfirm(
      String otp, int session) async {
    try {
      final response = await DioConfig.inheritance.createRequest().post(
        "https://client.arbuzmarket.com/api/cards/confirm",
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${userTokenBox.get('token')!.token.toString()}',
          },
        ),
        data: {
          "otp": otp,
          "session": session,
        },
      );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data =
            PostUserAddCardConfirmResponseModel.fromJson(response.data);
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

static Future<GeneralResponseModel?> putMainCard(int cardId) async {
    try {
      final response = await DioConfig.inheritance.createRequest().put(
            "https://client.arbuzmarket.com/api/cards/$cardId",
            options: Options(
              headers: {
                'Authorization':
                    'Bearer ${userTokenBox.get('token')!.token.toString()}',
              },
            ),
          );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = GeneralResponseModel.fromJson(response.data);
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

static Future<GeneralResponseModel?> deleteUserCard(int cardId) async {
    try {
      final response = await DioConfig.inheritance.createRequest().delete(
            "https://client.arbuzmarket.com/api/cards/$cardId",
            options: Options(
              headers: {
                'Authorization':
                    'Bearer ${userTokenBox.get('token')!.token.toString()}',
              },
            ),
          );
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        // final data = (response.data['item'] as List)
        //     .map((e) => BasketProductModel.fromJson(e))
        //     .toList();
        final data = GeneralResponseModel.fromJson(response.data);
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
