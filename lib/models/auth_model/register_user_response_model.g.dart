// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserResponseModel _$RegisterUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    RegisterUserResponseModel(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$RegisterUserResponseModelToJson(
        RegisterUserResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      clientId: (json['clientId'] as num?)?.toInt() ?? -1,
      otpSentPhone: json['otpSentPhone'] as String? ?? '',
      client: json['client'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'clientId': instance.clientId,
      'otpSentPhone': instance.otpSentPhone,
      'client': instance.client,
    };
