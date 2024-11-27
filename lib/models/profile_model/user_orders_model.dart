// To parse this JSON data, do
//
//     final userOrdersModel = userOrdersModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_orders_model.g.dart';

UserOrdersModel userOrdersModelFromJson(String str) =>
    UserOrdersModel.fromJson(json.decode(str));

String userOrdersModelToJson(UserOrdersModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class UserOrdersModel {
  @JsonKey(name: "result")
  Result result;
  @JsonKey(name: "error")
  Map error;

  UserOrdersModel(
    this.result, {
    this.error = const {},
  });

  factory UserOrdersModel.fromJson(Map<String, dynamic> json) =>
      _$UserOrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserOrdersModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "items")
  List<ResultItem> items;
  @JsonKey(name: "allCount")
  int allCount;

  Result({
    this.items = const [],
    this.allCount = -1,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class ResultItem {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "createdDate")
  DateTime createdDate;
  @JsonKey(name: "updatedDate")
  DateTime updatedDate;
  @JsonKey(name: "paymentType")
  int paymentType;
  @JsonKey(name: "deliveryType")
  int deliveryType;
  @JsonKey(name: "userId")
  int userId;
  @JsonKey(name: "fullName")
  String fullName;
  @JsonKey(name: "phoneNumber")
  String phoneNumber;
  @JsonKey(name: "regionId")
  int regionId;
  @JsonKey(name: "destrictId")
  int destrictId;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "comment")
  String comment;
  @JsonKey(name: "subOrders")
  List<SubOrder> subOrders;

  ResultItem(
    this.createdDate,
    this.updatedDate,{
    this.id = -1,
    this.paymentType = -1,
    this.deliveryType = -1,
    this.userId = -1,
    this.fullName = '',
    this.phoneNumber = '',
    this.regionId = -1,
    this.destrictId = -1,
    this.address = '',
    this.comment = '',
    this.subOrders = const [],
  });

  factory ResultItem.fromJson(Map<String, dynamic> json) =>
      _$ResultItemFromJson(json);

  Map<String, dynamic> toJson() => _$ResultItemToJson(this);
}

@JsonSerializable()
class SubOrder {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "organizationId")
  int organizationId;
  @JsonKey(name: "organizationName")
  String organizationName;
  @JsonKey(name: "reason")
  String reason;
  @JsonKey(name: "state")
  int state;
  @JsonKey(name: "updatedDate")
  String updatedDate;
  @JsonKey(name: "items")
  List<SubOrderItem> items;

  SubOrder({
    this.id = -1,
    this.organizationId = -1,
    this.organizationName = '',
    this.reason = '',
    this.state = -1,
    this.updatedDate = '',
    this.items = const [],
  });

  factory SubOrder.fromJson(Map<String, dynamic> json) =>
      _$SubOrderFromJson(json);

  Map<String, dynamic> toJson() => _$SubOrderToJson(this);
}

@JsonSerializable()
class SubOrderItem {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "count")
  int count;
  @JsonKey(name: "isAvailable")
  bool isAvailable;
  @JsonKey(name: "variationId")
  String variationId;
  @JsonKey(name: "variation")
  Variation variation;

  SubOrderItem(
    this.variation, {
    this.id = -1,
    this.count = -1,
    this.isAvailable = false,
    this.variationId = '',
  });

  factory SubOrderItem.fromJson(Map<String, dynamic> json) =>
      _$SubOrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$SubOrderItemToJson(this);
}

@JsonSerializable()
class Variation {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "count")
  int count;
  @JsonKey(name: "productId")
  String productId;
  @JsonKey(name: "idForOrder")
  int idForOrder;
  @JsonKey(name: "product")
  Product product;
  @JsonKey(name: "prices")
  List<Price> prices;
  @JsonKey(name: "files")
  List<FileElement> files;
  @JsonKey(name: "attributeValues")
  List<AttributeValue> attributeValues;
  @JsonKey(name: "isVisible")
  bool isVisible;
  @JsonKey(name: "moderationStatus")
  String moderationStatus;
  @JsonKey(name: "compensationOnly")
  bool compensationOnly;
  @JsonKey(name: "saleType")
  int saleType;
  @JsonKey(name: "oonModerationStatus")
  int oonModerationStatus;

  Variation(
    this.product, {
    this.id = '',
    this.count = -1,
    this.productId = '',
    this.idForOrder = -1,
    this.prices = const [],
    this.files = const [],
    this.attributeValues = const [],
    this.isVisible = false,
    this.moderationStatus = '',
    this.compensationOnly = false,
    this.saleType = -1,
    this.oonModerationStatus = -1,
  });

  factory Variation.fromJson(Map<String, dynamic> json) =>
      _$VariationFromJson(json);

  Map<String, dynamic> toJson() => _$VariationToJson(this);
}

@JsonSerializable()
class AttributeValue {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "value")
  String value;
  @JsonKey(name: "valueTranslation")
  String valueTranslation;
  @JsonKey(name: "valueTranslations")
  List<ValueTranslation> valueTranslations;
  @JsonKey(name: "attributeId")
  int attributeId;
  @JsonKey(name: "attribute")
  Attribute attribute;
  @JsonKey(name: "productId")
  String productId;
  @JsonKey(name: "variationId")
  String variationId;
  @JsonKey(name: "isVisible")
  bool isVisible;

  AttributeValue(
    this.attribute, {
    this.id = '',
    this.value = '',
    this.valueTranslation = '',
    this.valueTranslations = const [],
    this.attributeId = -1,
    this.productId = '',
    this.variationId = '',
    this.isVisible = false,
  });

  factory AttributeValue.fromJson(Map<String, dynamic> json) =>
      _$AttributeValueFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeValueToJson(this);
}

@JsonSerializable()
class Attribute {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "weight")
  int weight;
  @JsonKey(name: "dataType")
  String dataType;
  @JsonKey(name: "hasFilter")
  bool hasFilter;
  @JsonKey(name: "isValueTranslated")
  bool isValueTranslated;
  @JsonKey(name: "isRequired")
  bool isRequired;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "categoryId")
  int categoryId;
  @JsonKey(name: "filterId")
  int filterId;
  @JsonKey(name: "filter")
  Map filter;
  @JsonKey(name: "groupId")
  int groupId;
  @JsonKey(name: "isVisible")
  bool isVisible;
  @JsonKey(name: "type")
  String type;

  Attribute({
    this.id = -1,
    this.weight = -1,
    this.dataType = '',
    this.hasFilter = false,
    this.isValueTranslated = false,
    this.isRequired = false,
    this.name = '',
    this.description = '',
    this.categoryId = -1,
    this.filterId = -1,
    this.filter = const {},
    this.groupId = -1,
    this.isVisible = false,
    this.type = '',
  });

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@JsonSerializable()
class ValueTranslation {
  @JsonKey(name: "languageCode")
  String languageCode;
  @JsonKey(name: "text")
  String text;

  ValueTranslation({
    this.languageCode = '',
    this.text = '',
  });

  factory ValueTranslation.fromJson(Map<String, dynamic> json) =>
      _$ValueTranslationFromJson(json);

  Map<String, dynamic> toJson() => _$ValueTranslationToJson(this);
}

@JsonSerializable()
class FileElement {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "order")
  int order;
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "fileInfo")
  FileInfo fileInfo;
  @JsonKey(name: "variationId")
  String variationId;
  @JsonKey(name: "productId")
  String productId;
  @JsonKey(name: "isVisible")
  bool isVisible;

  FileElement(
    this.fileInfo, {
    this.id = '',
    this.order = -1,
    this.url = '',
    this.variationId = '',
    this.productId = '',
    this.isVisible = false,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) =>
      _$FileElementFromJson(json);

  Map<String, dynamic> toJson() => _$FileElementToJson(this);
}

@JsonSerializable()
class FileInfo {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "extension")
  String extension;
  @JsonKey(name: "contentType")
  String contentType;
  @JsonKey(name: "createdAt")
  String createdAt;
  @JsonKey(name: "isVisible")
  bool isVisible;

  FileInfo({
    this.id = '',
    this.url = '',
    this.name = '',
    this.extension = '',
    this.contentType = '',
    this.createdAt = '',
    this.isVisible = false,
  });

  factory FileInfo.fromJson(Map<String, dynamic> json) =>
      _$FileInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FileInfoToJson(this);
}

@JsonSerializable()
class Price {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "value")
  double value;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "currencyId")
  int currencyId;
  @JsonKey(name: "variationId")
  String variationId;

  Price({
    this.id = -1,
    this.value = -1.0,
    this.type = '',
    this.currencyId = -1,
    this.variationId = '',
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "state")
  String state;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "categoryId")
  int categoryId;
  @JsonKey(name: "organizationId")
  int organizationId;
  @JsonKey(name: "isVisible")
  bool isVisible;

  Product({
    this.id = '',
    this.state = '',
    this.name = '',
    this.description = '',
    this.categoryId = -1,
    this.organizationId = -1,
    this.isVisible = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
