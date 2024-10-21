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
  Result? result;
  @JsonKey(name: "error")
  Map error;

  RegisterConfirmResponseModel({
    this.result,
    this.error = const {},
  });

  factory RegisterConfirmResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterConfirmResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterConfirmResponseModelToJson(this);
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
  Map planInfo;

  Result({
    this.token = '',
    this.refreshToken = '',
    this.login = '',
    this.access = const [],
    this.planInfo = const {},
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
