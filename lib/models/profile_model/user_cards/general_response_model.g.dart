// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralResponseModel _$GeneralResponseModelFromJson(
        Map<String, dynamic> json) =>
    GeneralResponseModel(
      result: json['result'] == null
          ? const Result()
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] == null
          ? const Error()
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneralResponseModelToJson(
        GeneralResponseModel instance) =>
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
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'success': instance.success,
    };
