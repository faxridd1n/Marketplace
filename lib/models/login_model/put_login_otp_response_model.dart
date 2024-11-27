// To parse this JSON data, do
//
//     final putLoginOtpResponseModel = putLoginOtpResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'put_login_otp_response_model.g.dart';

PutLoginOtpResponseModel putLoginOtpResponseModelFromJson(String str) =>
    PutLoginOtpResponseModel.fromJson(json.decode(str));

String putLoginOtpResponseModelToJson(PutLoginOtpResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PutLoginOtpResponseModel {
  @JsonKey(name: "result")
  Result result;
  @JsonKey(name: "error")
  Map error;

  PutLoginOtpResponseModel(
    this.result, {
    this.error = const {},
  });

  factory PutLoginOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PutLoginOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PutLoginOtpResponseModelToJson(this);
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
  String planInfo;

  Result({
    this.token = '',
    this.refreshToken = '',
    this.login = '',
    this.access = const [],
    this.planInfo = '',
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
