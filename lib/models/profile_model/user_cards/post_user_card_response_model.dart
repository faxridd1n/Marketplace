// To parse this JSON data, do
//
//     final postUserCardResponseModel = postUserCardResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'post_user_card_response_model.g.dart';

PostUserCardResponseModel postUserCardResponseModelFromJson(String str) =>
    PostUserCardResponseModel.fromJson(json.decode(str));

String postUserCardResponseModelToJson(PostUserCardResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PostUserCardResponseModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Error error;

  const PostUserCardResponseModel({
    this.result = const Result(),
    this.error = const Error(),
  });

  factory PostUserCardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostUserCardResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostUserCardResponseModelToJson(this);
}

@JsonSerializable()
class Error {
  @JsonKey(name: "errorCode")
  final int errorCode;
  @JsonKey(name: "errorMessage")
  final String errorMessage;

  const Error({
    this.errorCode = -1,
    this.errorMessage = '',
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "session")
  final int session;
  @JsonKey(name: "otpSendPhone")
  final String otpSendPhone;
  @JsonKey(name: "cardName")
  final String cardName;

  const Result({
    this.session = -1,
    this.otpSendPhone = '',
    this.cardName = '',
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
