// To parse this JSON data, do
//
//     final registerConfirmResponseModel = registerConfirmResponseModelFromJson(jsonString);

// import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';

// part 'register_confirm_response_model.g.dart';

// RegisterConfirmResponseModel registerConfirmResponseModelFromJson(String str) =>
//     RegisterConfirmResponseModel.fromJson(json.decode(str));

// String registerConfirmResponseModelToJson(RegisterConfirmResponseModel data) =>
//     json.encode(data.toJson());

// @JsonSerializable()
// class RegisterConfirmResponseModel {
//   @JsonKey(name: "result")
//   Result? result;
//   @JsonKey(name: "error")
//   Map error;

//   RegisterConfirmResponseModel({
//     this.result,
//     this.error = const {},
//   });

//   factory RegisterConfirmResponseModel.fromJson(Map<String, dynamic> json) =>
//       _$RegisterConfirmResponseModelFromJson(json);

//   Map<String, dynamic> toJson() => _$RegisterConfirmResponseModelToJson(this);
// }

// @JsonSerializable()
// class Result {
//   @JsonKey(name: "token")
//   String token;
//   @JsonKey(name: "refreshToken")
//   String refreshToken;
//   @JsonKey(name: "login")
//   String login;
//   @JsonKey(name: "access")
//   List<String> access;
//   @JsonKey(name: "planInfo")
//   Map planInfo;

//   Result({
//     this.token = '',
//     this.refreshToken = '',
//     this.login = '',
//     this.access = const [],
//     this.planInfo = const {},
//   });

//   factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

//   Map<String, dynamic> toJson() => _$ResultToJson(this);
// }

// To parse this JSON data, do
//
//     final registerConfirmResponseModel = registerConfirmResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'register_confirm_response_model.g.dart';

RegisterConfirmResponseModel registerConfirmResponseModelFromJson(String str) =>
    RegisterConfirmResponseModel.fromJson(json.decode(str));

String registerConfirmResponseModelToJson(RegisterConfirmResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class RegisterConfirmResponseModel {
  @JsonKey(name: "result")
  Result result;
  @JsonKey(name: "error")
  Map error;

  RegisterConfirmResponseModel(
    this.result, {
    this.error = const {},
  });

  factory RegisterConfirmResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterConfirmResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterConfirmResponseModelToJson(this);
}

@JsonSerializable()
class Error {
  @JsonKey(name: "errorCode")
  int errorCode;
  @JsonKey(name: "errorMessage")
  String errorMessage;

  Error({
    this.errorCode = -1,
    this.errorMessage = '',
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "refreshToken")
  String refreshToken;
  @JsonKey(name: "login")
  String login;
  @JsonKey(name: "access")
  List<String> access;
  @JsonKey(name: "planInfo")
  PlanInfo planInfo;

  Result(
    this.planInfo, {
    this.token = '',
    this.refreshToken = '',
    this.login = '',
    this.access = const [],
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class PlanInfo {
  @JsonKey(name: "planId")
  int planId;
  @JsonKey(name: "planName")
  String planName;
  @JsonKey(name: "features")
  List<Feature> features;

  PlanInfo({
    this.planId = -1,
    this.planName = '',
    this.features = const [],
  });

  factory PlanInfo.fromJson(Map<String, dynamic> json) =>
      _$PlanInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PlanInfoToJson(this);
}

@JsonSerializable()
class Feature {
  @JsonKey(name: "featureId")
  int featureId;
  @JsonKey(name: "featureName")
  String featureName;
  @JsonKey(name: "featureKey")
  String featureKey;

  Feature({
    this.featureId = -1,
    this.featureName = '',
    this.featureKey = '',
  });

  factory Feature.fromJson(Map<String, dynamic> json) =>
      _$FeatureFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureToJson(this);
}
