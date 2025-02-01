// To parse this JSON data, do
//
//     final getUserCardsResponseModel = getUserCardsResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_user_cards_response_model.g.dart';

GetUserCardsResponseModel getUserCardsResponseModelFromJson(String str) =>
    GetUserCardsResponseModel.fromJson(json.decode(str));

String getUserCardsResponseModelToJson(GetUserCardsResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetUserCardsResponseModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Error error;

  const GetUserCardsResponseModel({
    this.result = const Result(),
    this.error = const Error(),
  });

  factory GetUserCardsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserCardsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserCardsResponseModelToJson(this);
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
  @JsonKey(name: "items")
  final List<Item> items;
  @JsonKey(name: "allCount")
  final int allCount;

  const Result({
    this.items = const [],
    this.allCount = -1,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Item {
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

  const Item({
    this.id = -1,
    this.ownerName = '',
    this.cardNumber = '',
    this.expireDate = '',
    this.isMainCard = false,
    this.bankName = '',
    this.bankLogo = '',
    this.cardType = -1,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
