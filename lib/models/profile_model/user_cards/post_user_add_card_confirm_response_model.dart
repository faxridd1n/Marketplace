// To parse this JSON data, do
//
//     final postUserAddCardConfirmResponseModel = postUserAddCardConfirmResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'post_user_add_card_confirm_response_model.g.dart';

PostUserAddCardConfirmResponseModel postUserAddCardConfirmResponseModelFromJson(
        String str) =>
    PostUserAddCardConfirmResponseModel.fromJson(json.decode(str));

String postUserAddCardConfirmResponseModelToJson(
        PostUserAddCardConfirmResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PostUserAddCardConfirmResponseModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Error error;

  const PostUserAddCardConfirmResponseModel({
    this.result = const Result(),
    this.error = const Error(),
  });

  factory PostUserAddCardConfirmResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$PostUserAddCardConfirmResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PostUserAddCardConfirmResponseModelToJson(this);
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
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "ownerName")
  final String ownerName;
  @JsonKey(name: "cardNumber")
  final String cardNumber;
  @JsonKey(name: "expireDate")
  final String expireDate;
  @JsonKey(name: "isMainCard")
  final bool isMainCard;
  @JsonKey(name: "bankName")
  final String bankName;
  @JsonKey(name: "bankLogo")
  final String bankLogo;
  @JsonKey(name: "cardType")
  final int cardType;

  const Result({
    this.id = -1,
    this.ownerName = '',
    this.cardNumber = '',
    this.expireDate = '',
    this.isMainCard = false,
    this.bankName = '',
    this.bankLogo = '',
    this.cardType = -1,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
