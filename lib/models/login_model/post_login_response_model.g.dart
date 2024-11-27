// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLoginResponseModel _$PostLoginResponseModelFromJson(
        Map<String, dynamic> json) =>
    PostLoginResponseModel(
      Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$PostLoginResponseModelToJson(
        PostLoginResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      DateTime.parse(json['sentDate'] as String),
      isSent: json['isSent'] as bool? ?? false,
      phone: json['phone'] as String? ?? '',
      sentText: json['sentText'] as String? ?? '',
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'isSent': instance.isSent,
      'phone': instance.phone,
      'sentText': instance.sentText,
      'sentDate': instance.sentDate.toIso8601String(),
    };
