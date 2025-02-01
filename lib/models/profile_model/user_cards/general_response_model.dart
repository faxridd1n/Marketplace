// To parse this JSON data, do
//
//     final putUserMainCardResponseModel = putUserMainCardResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'general_response_model.g.dart';

GeneralResponseModel putUserMainCardResponseModelFromJson(String str) =>
    GeneralResponseModel.fromJson(json.decode(str));

String putUserMainCardResponseModelToJson(GeneralResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GeneralResponseModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Error error;

  const GeneralResponseModel({
    this.result=const Result(),
    this.error=const Error(),
  });

  factory GeneralResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralResponseModelToJson(this);
}

@JsonSerializable()
class Error {
  @JsonKey(name: "errorCode")
  final int errorCode;
  @JsonKey(name: "errorMessage")
  final String errorMessage;

  const Error({
    this.errorCode=-1,
    this.errorMessage='',
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "success")
  final bool success;

  const Result({
    this.success = false,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
