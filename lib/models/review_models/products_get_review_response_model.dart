// To parse this JSON data, do
//
//     final productReviewsModel = productReviewsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'products_get_review_response_model.g.dart';

ProductsGetReviewResponseModel productReviewsModelFromJson(String str) =>
    ProductsGetReviewResponseModel.fromJson(json.decode(str));

String productReviewsModelToJson(ProductsGetReviewResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ProductsGetReviewResponseModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Map error;

  const ProductsGetReviewResponseModel({
    this.result = const Result(),
    this.error = const {},
  });

  factory ProductsGetReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsGetReviewResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsGetReviewResponseModelToJson(this);
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
  final String id;
  @JsonKey(name: "forId")
  final String forId;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "rating")
  final int rating;
  @JsonKey(name: "content")
  final String content;
  @JsonKey(name: "isAnonymous")
  final bool isAnonymous;
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "updatedDate")
  final String updatedDate;
  @JsonKey(name: "user")
  final User user;
  @JsonKey(name: "reply")
  final Map reply;

  const Item({
    this.id = '',
    this.forId = '',
    this.status = -1,
    this.rating = -1,
    this.content = '',
    this.isAnonymous = false,
    this.date = '',
    this.updatedDate = '',
    this.user = const User(),
    this.reply = const {},
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "userId")
  final int userId;
  @JsonKey(name: "firstname")
  final String firstname;
  @JsonKey(name: "lastname")
  final String lastname;

  const User({
    this.userId = -1,
    this.firstname = '',
    this.lastname = '',
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
