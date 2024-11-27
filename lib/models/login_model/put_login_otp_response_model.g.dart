// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_login_otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutLoginOtpResponseModel _$PutLoginOtpResponseModelFromJson(
        Map<String, dynamic> json) =>
    PutLoginOtpResponseModel(
      Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$PutLoginOtpResponseModelToJson(
        PutLoginOtpResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      token: json['token'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      login: json['login'] as String? ?? '',
      access: (json['access'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      planInfo: json['planInfo'] as String? ?? '',
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'login': instance.login,
      'access': instance.access,
      'planInfo': instance.planInfo,
    };
