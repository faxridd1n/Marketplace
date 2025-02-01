// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_user_card_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostUserCardResponseModel _$PostUserCardResponseModelFromJson(
        Map<String, dynamic> json) =>
    PostUserCardResponseModel(
      result: json['result'] == null
          ? const Result()
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] == null
          ? const Error()
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostUserCardResponseModelToJson(
        PostUserCardResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      errorCode: (json['errorCode'] as num?)?.toInt() ?? -1,
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      session: (json['session'] as num?)?.toInt() ?? -1,
      otpSendPhone: json['otpSendPhone'] as String? ?? '',
      cardName: json['cardName'] as String? ?? '',
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'session': instance.session,
      'otpSendPhone': instance.otpSendPhone,
      'cardName': instance.cardName,
    };
