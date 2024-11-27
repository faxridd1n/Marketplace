// To parse this JSON data, do
//
//     final postLoginResponseModel = postLoginResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'post_login_response_model.g.dart';

PostLoginResponseModel postLoginResponseModelFromJson(String str) =>
    PostLoginResponseModel.fromJson(json.decode(str));

String postLoginResponseModelToJson(PostLoginResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PostLoginResponseModel {
  @JsonKey(name: "result")
  Result result;
  @JsonKey(name: "error")
  Map error;

  PostLoginResponseModel(
    this.result, {
    this.error = const {},
  });

  factory PostLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostLoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostLoginResponseModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "isSent")
  bool isSent;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "sentText")
  String sentText;
  @JsonKey(name: "sentDate")
  DateTime sentDate;

  Result(
    this.sentDate, {
    this.isSent = false,
    this.phone = '',
    this.sentText = '',
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
