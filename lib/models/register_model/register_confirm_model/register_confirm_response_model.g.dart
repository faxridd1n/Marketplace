// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_confirm_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterConfirmResponseModel _$RegisterConfirmResponseModelFromJson(
        Map<String, dynamic> json) =>
    RegisterConfirmResponseModel(
      Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$RegisterConfirmResponseModelToJson(
        RegisterConfirmResponseModel instance) =>
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
      PlanInfo.fromJson(json['planInfo'] as Map<String, dynamic>),
      token: json['token'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      login: json['login'] as String? ?? '',
      access: (json['access'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'login': instance.login,
      'access': instance.access,
      'planInfo': instance.planInfo,
    };

PlanInfo _$PlanInfoFromJson(Map<String, dynamic> json) => PlanInfo(
      planId: (json['planId'] as num?)?.toInt() ?? -1,
      planName: json['planName'] as String? ?? '',
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => Feature.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PlanInfoToJson(PlanInfo instance) => <String, dynamic>{
      'planId': instance.planId,
      'planName': instance.planName,
      'features': instance.features,
    };

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      featureId: (json['featureId'] as num?)?.toInt() ?? -1,
      featureName: json['featureName'] as String? ?? '',
      featureKey: json['featureKey'] as String? ?? '',
    );

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'featureId': instance.featureId,
      'featureName': instance.featureName,
      'featureKey': instance.featureKey,
    };
