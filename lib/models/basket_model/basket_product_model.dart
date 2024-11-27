// To parse this JSON data, do
//
//     final basketProductModel = basketProductModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'basket_product_model.g.dart';

BasketProductModel basketProductModelFromJson(String str) =>
    BasketProductModel.fromJson(json.decode(str));

String basketProductModelToJson(BasketProductModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class BasketProductModel {
  @JsonKey(name: "result")
  Result result;
  @JsonKey(name: "error")
  Map error;

  BasketProductModel({
    required this.result,
    this.error = const {},
  });

  factory BasketProductModel.fromJson(Map<String, dynamic> json) =>
      _$BasketProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketProductModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "period")
  int period;
  @JsonKey(name: "saleType")
  int saleType;
  @JsonKey(name: "products")
  List<ProductElement> products;
  @JsonKey(name: "totalProductCount")
  int totalProductCount;
  @JsonKey(name: "originPrice")
  int originPrice;
  @JsonKey(name: "vatPrice")
  int vatPrice;
  @JsonKey(name: "compensationPrice")
  int compensationPrice;
  @JsonKey(name: "installmentPrice")
  int installmentPrice;
  @JsonKey(name: "oonCompensationMale")
  int oonCompensationMale;
  @JsonKey(name: "oonCompensationFemale")
  int oonCompensationFemale;
  @JsonKey(name: "orgId")
  int orgId;

  Result({
    this.id = -1,
    this.period = -1,
    this.saleType = -1,
    this.products = const [],
    this.totalProductCount = -1,
    this.originPrice = -1,
    this.vatPrice = -1,
    this.compensationPrice = -1,
    this.installmentPrice = -1,
    this.oonCompensationMale = -1,
    this.oonCompensationFemale = -1,
    this.orgId = -1,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class ProductElement {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "count")
  int count;
  @JsonKey(name: "productId")
  String productId;
  @JsonKey(name: "product")
  ProductProduct product;
  @JsonKey(name: "prices")
  List<Price> prices;
  @JsonKey(name: "files")
  List<FileElement> files;
  @JsonKey(name: "attributeValues")
  List<AttributeValue> attributeValues;

  ProductElement(
    this.product, {
    this.id = '',
    this.count = -1,
    this.productId = '',
    this.prices = const [],
    this.files = const [],
    this.attributeValues = const [],
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) =>
      _$ProductElementFromJson(json);

  Map<String, dynamic> toJson() => _$ProductElementToJson(this);
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
  DateTime createdAt;
  @JsonKey(name: "isVisible")
  bool isVisible;

  FileInfo(
    this.createdAt,
    this.extension, {
    this.id = '',
    this.url = '',
    this.name = '',
    this.contentType = '',
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
  int value;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "currencyId")
  int currencyId;
  @JsonKey(name: "variationId")
  String variationId;

  Price({
    this.id = -1,
    this.value = -1,
    this.type = '',
    this.currencyId = -1,
    this.variationId = '',
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable()
class ProductProduct {
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

  ProductProduct({
    this.id = '',
    this.state = '',
    this.name = '',
    this.description = '',
    this.categoryId = -1,
    this.organizationId = -1,
    this.isVisible = false,
  });

  factory ProductProduct.fromJson(Map<String, dynamic> json) =>
      _$ProductProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductProductToJson(this);
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
