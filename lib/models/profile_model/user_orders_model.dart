// // To parse this JSON data, do
// //
// //     final userOrdersModel = userOrdersModelFromJson(jsonString);

// import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';

// part 'user_orders_model.g.dart';

// UserOrdersModel userOrdersModelFromJson(String str) => UserOrdersModel.fromJson(json.decode(str));

// String userOrdersModelToJson(UserOrdersModel data) => json.encode(data.toJson());

// @JsonSerializable()
// class UserOrdersModel {
//     @JsonKey(name: "result")
//     Result result;
//     @JsonKey(name: "error")
//     dynamic error;

//     UserOrdersModel({
//         this.result,
//         this.error,
//     });

//     factory UserOrdersModel.fromJson(Map<String, dynamic> json) => _$UserOrdersModelFromJson(json);

//     Map<String, dynamic> toJson() => _$UserOrdersModelToJson(this);
// }

// @JsonSerializable()
// class Result {
//     @JsonKey(name: "items")
//     List<ResultItem> items;
//     @JsonKey(name: "allCount")
//     int allCount;

//     Result({
//         this.items,
//         this.allCount,
//     });

//     factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

//     Map<String, dynamic> toJson() => _$ResultToJson(this);
// }

// @JsonSerializable()
// class ResultItem {
//     @JsonKey(name: "id")
//     int id;
//     @JsonKey(name: "createdDate")
//     DateTime createdDate;
//     @JsonKey(name: "updatedDate")
//     DateTime updatedDate;
//     @JsonKey(name: "paymentType")
//     int paymentType;
//     @JsonKey(name: "deliveryType")
//     int deliveryType;
//     @JsonKey(name: "userId")
//     int userId;
//     @JsonKey(name: "fullName")
//     String fullName;
//     @JsonKey(name: "phoneNumber")
//     String phoneNumber;
//     @JsonKey(name: "regionId")
//     int regionId;
//     @JsonKey(name: "destrictId")
//     int destrictId;
//     @JsonKey(name: "address")
//     String address;
//     @JsonKey(name: "comment")
//     String comment;
//     @JsonKey(name: "subOrders")
//     List<SubOrder> subOrders;

//     ResultItem({
//         this.id,
//         this.createdDate,
//         this.updatedDate,
//         this.paymentType,
//         this.deliveryType,
//         this.userId,
//         this.fullName,
//         this.phoneNumber,
//         this.regionId,
//         this.destrictId,
//         this.address,
//         this.comment,
//         this.subOrders,
//     });

//     factory ResultItem.fromJson(Map<String, dynamic> json) => _$ResultItemFromJson(json);

//     Map<String, dynamic> toJson() => _$ResultItemToJson(this);
// }

// @JsonSerializable()
// class SubOrder {
//     @JsonKey(name: "id")
//     int id;
//     @JsonKey(name: "organizationId")
//     int organizationId;
//     @JsonKey(name: "organizationName")
//     String organizationName;
//     @JsonKey(name: "reason")
//     String reason;
//     @JsonKey(name: "state")
//     int state;
//     @JsonKey(name: "updatedDate")
//     DateTime updatedDate;
//     @JsonKey(name: "items")
//     List<SubOrderItem> items;

//     SubOrder({
//         this.id,
//         this.organizationId,
//         this.organizationName,
//         this.reason,
//         this.state,
//         this.updatedDate,
//         this.items,
//     });

//     factory SubOrder.fromJson(Map<String, dynamic> json) => _$SubOrderFromJson(json);

//     Map<String, dynamic> toJson() => _$SubOrderToJson(this);
// }

// @JsonSerializable()
// class SubOrderItem {
//     @JsonKey(name: "id")
//     int id;
//     @JsonKey(name: "count")
//     int count;
//     @JsonKey(name: "isAvailable")
//     dynamic isAvailable;
//     @JsonKey(name: "variationId")
//     String variationId;
//     @JsonKey(name: "variation")
//     Variation variation;

//     SubOrderItem({
//         this.id,
//         this.count,
//         this.isAvailable,
//         this.variationId,
//         this.variation,
//     });

//     factory SubOrderItem.fromJson(Map<String, dynamic> json) => _$SubOrderItemFromJson(json);

//     Map<String, dynamic> toJson() => _$SubOrderItemToJson(this);
// }

// @JsonSerializable()
// class Variation {
//     @JsonKey(name: "id")
//     String id;
//     @JsonKey(name: "count")
//     int count;
//     @JsonKey(name: "productId")
//     String productId;
//     @JsonKey(name: "idForOrder")
//     int idForOrder;
//     @JsonKey(name: "product")
//     Product product;
//     @JsonKey(name: "prices")
//     List<Price> prices;
//     @JsonKey(name: "files")
//     List<FileElement> files;
//     @JsonKey(name: "attributeValues")
//     List<AttributeValue> attributeValues;
//     @JsonKey(name: "isVisible")
//     bool isVisible;
//     @JsonKey(name: "moderationStatus")
//     String moderationStatus;
//     @JsonKey(name: "compensationOnly")
//     bool compensationOnly;
//     @JsonKey(name: "saleType")
//     int saleType;
//     @JsonKey(name: "oonModerationStatus")
//     int oonModerationStatus;

//     Variation({
//         this.id,
//         this.count,
//         this.productId,
//         this.idForOrder,
//         this.product,
//         this.prices,
//         this.files,
//         this.attributeValues,
//         this.isVisible,
//         this.moderationStatus,
//         this.compensationOnly,
//         this.saleType,
//         this.oonModerationStatus,
//     });

//     factory Variation.fromJson(Map<String, dynamic> json) => _$VariationFromJson(json);

//     Map<String, dynamic> toJson() => _$VariationToJson(this);
// }

// @JsonSerializable()
// class AttributeValue {
//     @JsonKey(name: "id")
//     String id;
//     @JsonKey(name: "value")
//     String value;
//     @JsonKey(name: "valueTranslation")
//     String valueTranslation;
//     @JsonKey(name: "valueTranslations")
//     List<ValueTranslation> valueTranslations;
//     @JsonKey(name: "attributeId")
//     int attributeId;
//     @JsonKey(name: "attribute")
//     Attribute attribute;
//     @JsonKey(name: "productId")
//     dynamic productId;
//     @JsonKey(name: "variationId")
//     String variationId;
//     @JsonKey(name: "isVisible")
//     bool isVisible;

//     AttributeValue({
//         this.id,
//         this.value,
//         this.valueTranslation,
//         this.valueTranslations,
//         this.attributeId,
//         this.attribute,
//         this.productId,
//         this.variationId,
//         this.isVisible,
//     });

//     factory AttributeValue.fromJson(Map<String, dynamic> json) => _$AttributeValueFromJson(json);

//     Map<String, dynamic> toJson() => _$AttributeValueToJson(this);
// }

// @JsonSerializable()
// class Attribute {
//     @JsonKey(name: "id")
//     int id;
//     @JsonKey(name: "weight")
//     int weight;
//     @JsonKey(name: "dataType")
//     DataType dataType;
//     @JsonKey(name: "hasFilter")
//     bool hasFilter;
//     @JsonKey(name: "isValueTranslated")
//     bool isValueTranslated;
//     @JsonKey(name: "isRequired")
//     bool isRequired;
//     @JsonKey(name: "name")
//     String name;
//     @JsonKey(name: "description")
//     String description;
//     @JsonKey(name: "categoryId")
//     int categoryId;
//     @JsonKey(name: "filterId")
//     dynamic filterId;
//     @JsonKey(name: "filter")
//     dynamic filter;
//     @JsonKey(name: "groupId")
//     dynamic groupId;
//     @JsonKey(name: "isVisible")
//     bool isVisible;
//     @JsonKey(name: "type")
//     AttributeType type;

//     Attribute({
//         this.id,
//         this.weight,
//         this.dataType,
//         this.hasFilter,
//         this.isValueTranslated,
//         this.isRequired,
//         this.name,
//         this.description,
//         this.categoryId,
//         this.filterId,
//         this.filter,
//         this.groupId,
//         this.isVisible,
//         this.type,
//     });

//     factory Attribute.fromJson(Map<String, dynamic> json) => _$AttributeFromJson(json);

//     Map<String, dynamic> toJson() => _$AttributeToJson(this);
// }

// enum DataType {
//     @JsonValue("Text")
//     TEXT
// }

// final dataTypeValues = EnumValues({
//     "Text": DataType.TEXT
// });

// enum AttributeType {
//     @JsonValue("Basic")
//     BASIC
// }

// final attributeTypeValues = EnumValues({
//     "Basic": AttributeType.BASIC
// });

// @JsonSerializable()
// class ValueTranslation {
//     @JsonKey(name: "languageCode")
//     LanguageCode languageCode;
//     @JsonKey(name: "text")
//     String text;

//     ValueTranslation({
//         this.languageCode,
//         this.text,
//     });

//     factory ValueTranslation.fromJson(Map<String, dynamic> json) => _$ValueTranslationFromJson(json);

//     Map<String, dynamic> toJson() => _$ValueTranslationToJson(this);
// }

// enum LanguageCode {
//     @JsonValue("en")
//     EN,
//     @JsonValue("ru")
//     RU,
//     @JsonValue("uz-Cyrl-QQ")
//     UZ_CYRL_QQ,
//     @JsonValue("uz-Cyrl-UZ")
//     UZ_CYRL_UZ,
//     @JsonValue("uz-Latn-UZ")
//     UZ_LATN_UZ
// }

// final languageCodeValues = EnumValues({
//     "en": LanguageCode.EN,
//     "ru": LanguageCode.RU,
//     "uz-Cyrl-QQ": LanguageCode.UZ_CYRL_QQ,
//     "uz-Cyrl-UZ": LanguageCode.UZ_CYRL_UZ,
//     "uz-Latn-UZ": LanguageCode.UZ_LATN_UZ
// });

// @JsonSerializable()
// class FileElement {
//     @JsonKey(name: "id")
//     String id;
//     @JsonKey(name: "order")
//     int order;
//     @JsonKey(name: "url")
//     String url;
//     @JsonKey(name: "fileInfo")
//     FileInfo fileInfo;
//     @JsonKey(name: "variationId")
//     String variationId;
//     @JsonKey(name: "productId")
//     dynamic productId;
//     @JsonKey(name: "isVisible")
//     bool isVisible;

//     FileElement({
//         this.id,
//         this.order,
//         this.url,
//         this.fileInfo,
//         this.variationId,
//         this.productId,
//         this.isVisible,
//     });

//     factory FileElement.fromJson(Map<String, dynamic> json) => _$FileElementFromJson(json);

//     Map<String, dynamic> toJson() => _$FileElementToJson(this);
// }

// @JsonSerializable()
// class FileInfo {
//     @JsonKey(name: "id")
//     String id;
//     @JsonKey(name: "url")
//     String url;
//     @JsonKey(name: "name")
//     String name;
//     @JsonKey(name: "extension")
//     String extension;
//     @JsonKey(name: "contentType")
//     String contentType;
//     @JsonKey(name: "createdAt")
//     DateTime createdAt;
//     @JsonKey(name: "isVisible")
//     bool isVisible;

//     FileInfo({
//         this.id,
//         this.url,
//         this.name,
//         this.extension,
//         this.contentType,
//         this.createdAt,
//         this.isVisible,
//     });

//     factory FileInfo.fromJson(Map<String, dynamic> json) => _$FileInfoFromJson(json);

//     Map<String, dynamic> toJson() => _$FileInfoToJson(this);
// }

// @JsonSerializable()
// class Price {
//     @JsonKey(name: "id")
//     int id;
//     @JsonKey(name: "value")
//     int value;
//     @JsonKey(name: "type")
//     PriceType type;
//     @JsonKey(name: "currencyId")
//     int currencyId;
//     @JsonKey(name: "variationId")
//     String variationId;

//     Price({
//         this.id,
//         this.value,
//         this.type,
//         this.currencyId,
//         this.variationId,
//     });

//     factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

//     Map<String, dynamic> toJson() => _$PriceToJson(this);
// }

// enum PriceType {
//     @JsonValue("Price")
//     PRICE,
//     @JsonValue("Vat")
//     VAT
// }

// final priceTypeValues = EnumValues({
//     "Price": PriceType.PRICE,
//     "Vat": PriceType.VAT
// });

// @JsonSerializable()
// class Product {
//     @JsonKey(name: "id")
//     String id;
//     @JsonKey(name: "state")
//     String state;
//     @JsonKey(name: "name")
//     String name;
//     @JsonKey(name: "description")
//     String description;
//     @JsonKey(name: "categoryId")
//     int categoryId;
//     @JsonKey(name: "organizationId")
//     int organizationId;
//     @JsonKey(name: "isVisible")
//     bool isVisible;

//     Product({
//         this.id,
//         this.state,
//         this.name,
//         this.description,
//         this.categoryId,
//         this.organizationId,
//         this.isVisible,
//     });

//     factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

//     Map<String, dynamic> toJson() => _$ProductToJson(this);
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }
