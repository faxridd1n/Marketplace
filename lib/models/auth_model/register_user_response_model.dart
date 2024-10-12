// To parse this JSON data, do
//
//     final registerUserResponseModel = registerUserResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'register_user_response_model.g.dart';

RegisterUserResponseModel registerUserResponseModelFromJson(String str) =>
    RegisterUserResponseModel.fromJson(json.decode(str));

String registerUserResponseModelToJson(RegisterUserResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class RegisterUserResponseModel {
  @JsonKey(name: "result")
  Result? result;
  @JsonKey(name: "error")
  Map error;

  RegisterUserResponseModel({
    this.result,
    this.error = const {},
  });

  factory RegisterUserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserResponseModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "clientId")
  int clientId;
  @JsonKey(name: "otpSentPhone")
  String otpSentPhone;
  @JsonKey(name: "client")
  Map client;

  Result({
    this.clientId = -1,
    this.otpSentPhone = '',
    this.client = const {},
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
