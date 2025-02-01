// To parse this JSON data, do
//
//     final postOrderResponseModel = postOrderResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'post_order_response_model.g.dart';

PostOrderResponseModel postOrderResponseModelFromJson(String str) =>
    PostOrderResponseModel.fromJson(json.decode(str));

String postOrderResponseModelToJson(PostOrderResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PostOrderResponseModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Error error;

  const PostOrderResponseModel({
    this.result = const Result(),
    this.error = const Error(),
  });
  factory PostOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostOrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostOrderResponseModelToJson(this);
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
  @JsonKey(name: "createdDate")
  final String createdDate;
  @JsonKey(name: "updatedDate")
  final String updatedDate;
  @JsonKey(name: "paymentType")
  final int paymentType;
  @JsonKey(name: "deliveryType")
  final int deliveryType;
  @JsonKey(name: "userId")
  final int userId;
  @JsonKey(name: "fullName")
  final String fullName;
  @JsonKey(name: "phoneNumber")
  final String phoneNumber;
  @JsonKey(name: "regionId")
  final int regionId;
  @JsonKey(name: "regionName")
  final String regionName;
  @JsonKey(name: "destrictId")
  final int destrictId;
  @JsonKey(name: "destrictName")
  final String destrictName;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "comment")
  final String comment;
  @JsonKey(name: "subOrders")
  final List<SubOrder> subOrders;

  const Result({
    this.id = -1,
    this.createdDate = '',
    this.updatedDate = '',
    this.paymentType = -1,
    this.deliveryType = -1,
    this.userId = -1,
    this.fullName = '',
    this.phoneNumber = '',
    this.regionId = -1,
    this.regionName = '',
    this.destrictId = -1,
    this.destrictName = '',
    this.address = '',
    this.comment = '',
    this.subOrders = const [],
  });
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class SubOrder {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "organizationId")
  final int organizationId;
  @JsonKey(name: "organizationName")
  final String organizationName;
  @JsonKey(name: "organizationPhoneNumber")
  final String organizationPhoneNumber;
  @JsonKey(name: "reason")
  final String reason;
  @JsonKey(name: "state")
  final int state;
  @JsonKey(name: "updatedDate")
  final String updatedDate;
  @JsonKey(name: "items")
  final List<ProductItem> items;

  const SubOrder({
    this.id = -1,
    this.organizationId = -1,
    this.organizationName = '',
    this.organizationPhoneNumber = '',
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
class ProductItem {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "isAvailable")
  final bool isAvailable;
  @JsonKey(name: "variationId")
  final String variationId;
  @JsonKey(name: "variation")
  final Variation variation;

  const ProductItem({
    this.id = -1,
    this.count = -1,
    this.isAvailable = false,
    this.variationId = '',
    this.variation = const Variation(),
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}

@JsonSerializable()
class Variation {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "productId")
  final String productId;
  @JsonKey(name: "idForOrder")
  final int idForOrder;
  @JsonKey(name: "product")
  final Product product;
  @JsonKey(name: "prices")
  final List<Price> prices;
  @JsonKey(name: "files")
  final List<FileElement> files;
  @JsonKey(name: "attributeValues")
  final List<AttributeValue> attributeValues;
  @JsonKey(name: "isVisible")
  final bool isVisible;
  @JsonKey(name: "moderationStatus")
  final String moderationStatus;
  @JsonKey(name: "compensationOnly")
  final bool compensationOnly;
  @JsonKey(name: "saleType")
  final int saleType;
  @JsonKey(name: "oonModerationStatus")
  final int oonModerationStatus;

  const Variation({
    this.id = '',
    this.count = -1,
    this.productId = '',
    this.idForOrder = -1,
    this.product = const Product(),
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
  final String id;
  @JsonKey(name: "value")
  final String value;
  @JsonKey(name: "valueTranslation")
  final String valueTranslation;
  @JsonKey(name: "valueTranslations")
  final List<ValueTranslation> valueTranslations;
  @JsonKey(name: "attributeId")
  final int attributeId;
  @JsonKey(name: "attribute")
  final Attribute attribute;
  @JsonKey(name: "productId")
  final String productId;
  @JsonKey(name: "variationId")
  final String variationId;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const AttributeValue({
    this.id = '',
    this.value = '',
    this.valueTranslation = '',
    this.valueTranslations = const [],
    this.attributeId = -1,
    this.attribute = const Attribute(),
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
  final int id;
  @JsonKey(name: "weight")
  final int weight;
  @JsonKey(name: "dataType")
  final String dataType;
  @JsonKey(name: "hasFilter")
  final bool hasFilter;
  @JsonKey(name: "isValueTranslated")
  final bool isValueTranslated;
  @JsonKey(name: "isRequired")
  final bool isRequired;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "names")
  final List<ValueTranslation> names;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "categoryId")
  final int categoryId;
  @JsonKey(name: "filterId")
  final int filterId;
  @JsonKey(name: "filter")
  final Filter filter;
  @JsonKey(name: "groupId")
  final int groupId;
  @JsonKey(name: "isVisible")
  final bool isVisible;
  @JsonKey(name: "isAdditional")
  final bool isAdditional;
  @JsonKey(name: "type")
  final String type;

  const Attribute({
    this.id = -1,
    this.weight = -1,
    this.dataType = '',
    this.hasFilter = false,
    this.isValueTranslated = false,
    this.isRequired = false,
    this.name = '',
    this.names = const [],
    this.description = '',
    this.categoryId = -1,
    this.filterId = -1,
    this.filter = const Filter(),
    this.groupId = -1,
    this.isVisible = false,
    this.isAdditional = false,
    this.type = '',
  });

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@JsonSerializable()
class Filter {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "filterType")
  final String filterType;
  @JsonKey(name: "values")
  final String values;
  @JsonKey(name: "dataType")
  final String dataType;
  @JsonKey(name: "weight")
  final int weight;
  @JsonKey(name: "categoryId")
  final int categoryId;
  @JsonKey(name: "category")
  final Category category;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const Filter({
    this.id = -1,
    this.name = '',
    this.filterType = '',
    this.values = '',
    this.dataType = '',
    this.weight = -1,
    this.categoryId = -1,
    this.category = const Category(),
    this.isVisible = false,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "imageId")
  final String imageId;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const Category({
    this.id = -1,
    this.name = '',
    this.imageId = '',
    this.isVisible = false,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class ValueTranslation {
  @JsonKey(name: "languageCode")
  final String languageCode;
  @JsonKey(name: "text")
  final String text;

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
  final String id;
  @JsonKey(name: "order")
  final int order;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "fileInfo")
  final FileInfo fileInfo;
  @JsonKey(name: "variationId")
  final String variationId;
  @JsonKey(name: "productId")
  final String productId;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const FileElement({
    this.id = '',
    this.order = -1,
    this.url = '',
    this.fileInfo = const FileInfo(),
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
  final String id;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "extension")
  final String extension;
  @JsonKey(name: "contentType")
  final String contentType;
  @JsonKey(name: "createdAt")
  final String createdAt;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const FileInfo({
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
  final int id;
  @JsonKey(name: "value")
  final int value;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "currencyId")
  final int currencyId;
  @JsonKey(name: "variationId")
  final String variationId;

  const Price({
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
class Product {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "state")
  final String state;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "categoryId")
  final int categoryId;
  @JsonKey(name: "organizationId")
  final int organizationId;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const Product({
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
