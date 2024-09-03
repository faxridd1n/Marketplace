// // To parse this JSON data, do
// //
// //     final basketProductModel = basketProductModelFromJson(jsonString);

// import 'dart:convert';

// BasketProductModel basketProductModelFromJson(String str) =>
//     BasketProductModel.fromJson(json.decode(str));

// String basketProductModelToJson(BasketProductModel data) =>
//     json.encode(data.toJson());

// class BasketProductModel {
//   String? id;
//   int? count;
//   String? productId;
//   Product? product;
//   List<Price>? prices;
//   List<FileElement>? files;
//   List<AttributeValue>? attributeValues;

//   BasketProductModel({
//     this.id,
//     this.count,
//     this.productId,
//     this.product,
//     this.prices,
//     this.files,
//     this.attributeValues,
//   });

//   factory BasketProductModel.fromJson(Map<String, dynamic> json) =>
//       BasketProductModel(
//         id: json["id"],
//         count: json["count"],
//         productId: json["productId"],
//         product:
//             json["product"] == null ? null : Product.fromJson(json["product"]),
//         prices: json["prices"] == null
//             ? []
//             : List<Price>.from(json["prices"]!.map((x) => Price.fromJson(x))),
//         files: json["files"] == null
//             ? []
//             : List<FileElement>.from(
//                 json["files"]!.map((x) => FileElement.fromJson(x))),
//         attributeValues: json["attributeValues"] == null
//             ? []
//             : List<AttributeValue>.from(json["attributeValues"]!
//                 .map((x) => AttributeValue.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "count": count,
//         "productId": productId,
//         "product": product?.toJson(),
//         "prices": prices == null
//             ? []
//             : List<dynamic>.from(prices!.map((x) => x.toJson())),
//         "files": files == null
//             ? []
//             : List<dynamic>.from(files!.map((x) => x.toJson())),
//         "attributeValues": attributeValues == null
//             ? []
//             : List<dynamic>.from(attributeValues!.map((x) => x.toJson())),
//       };
// }

// class AttributeValue {
//   String? id;
//   String? value;
//   String? valueTranslation;
//   List<ValueTranslation>? valueTranslations;
//   int? attributeId;
//   Attribute? attribute;
//   String? productId;
//   String? variationId;
//   bool? isVisible;

//   AttributeValue({
//     this.id,
//     this.value,
//     this.valueTranslation,
//     this.valueTranslations,
//     this.attributeId,
//     this.attribute,
//     this.productId,
//     this.variationId,
//     this.isVisible,
//   });

//   factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
//         id: json["id"],
//         value: json["value"],
//         valueTranslation: json["valueTranslation"],
//         valueTranslations: json["valueTranslations"] == null
//             ? []
//             : List<ValueTranslation>.from(json["valueTranslations"]!
//                 .map((x) => ValueTranslation.fromJson(x))),
//         attributeId: json["attributeId"],
//         attribute: json["attribute"] == null
//             ? null
//             : Attribute.fromJson(json["attribute"]),
//         productId: json["productId"],
//         variationId: json["variationId"],
//         isVisible: json["isVisible"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "value": value,
//         "valueTranslation": valueTranslation,
//         "valueTranslations": valueTranslations == null
//             ? []
//             : List<dynamic>.from(valueTranslations!.map((x) => x.toJson())),
//         "attributeId": attributeId,
//         "attribute": attribute?.toJson(),
//         "productId": productId,
//         "variationId": variationId,
//         "isVisible": isVisible,
//       };
// }

// class Attribute {
//   int? id;
//   int? weight;
//   DataType? dataType;
//   bool? hasFilter;
//   bool? isValueTranslated;
//   bool? isRequired;
//   String? name;
//   String? description;
//   int? categoryId;
//   int? filterId;
//   Map? filter;
//   int? groupId;
//   bool? isVisible;
//   Type? type;

//   Attribute({
//     this.id,
//     this.weight,
//     this.dataType,
//     this.hasFilter,
//     this.isValueTranslated,
//     this.isRequired,
//     this.name,
//     this.description,
//     this.categoryId,
//     this.filterId,
//     this.filter,
//     this.groupId,
//     this.isVisible,
//     this.type,
//   });

//   factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
//         id: json["id"],
//         weight: json["weight"],
//         dataType: dataTypeValues.map[json["dataType"]]!,
//         hasFilter: json["hasFilter"],
//         isValueTranslated: json["isValueTranslated"],
//         isRequired: json["isRequired"],
//         name: json["name"],
//         description: json["description"],
//         categoryId: json["categoryId"],
//         filterId: json["filterId"],
//         filter: json["filter"],
//         groupId: json["groupId"],
//         isVisible: json["isVisible"],
//         type: typeValues.map[json["type"]]!,
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "weight": weight,
//         "dataType": dataTypeValues.reverse[dataType],
//         "hasFilter": hasFilter,
//         "isValueTranslated": isValueTranslated,
//         "isRequired": isRequired,
//         "name": name,
//         "description": description,
//         "categoryId": categoryId,
//         "filterId": filterId,
//         "filter": filter,
//         "groupId": groupId,
//         "isVisible": isVisible,
//         "type": typeValues.reverse[type],
//       };
// }

// enum DataType { TEXT }

// final dataTypeValues = EnumValues({"Text": DataType.TEXT});

// enum Type { BASIC }

// final typeValues = EnumValues({"Basic": Type.BASIC});

// class ValueTranslation {
//   LanguageCode? languageCode;
//   String? text;

//   ValueTranslation({
//     this.languageCode,
//     this.text,
//   });

//   factory ValueTranslation.fromJson(Map<String, dynamic> json) =>
//       ValueTranslation(
//         languageCode: languageCodeValues.map[json["languageCode"]]!,
//         text: json["text"],
//       );

//   Map<String, dynamic> toJson() => {
//         "languageCode": languageCodeValues.reverse[languageCode],
//         "text": text,
//       };
// }

// enum LanguageCode { EN, RU, UZ_CYRL_QQ, UZ_CYRL_UZ, UZ_LATN_UZ }

// final languageCodeValues = EnumValues({
//   "en": LanguageCode.EN,
//   "ru": LanguageCode.RU,
//   "uz-Cyrl-QQ": LanguageCode.UZ_CYRL_QQ,
//   "uz-Cyrl-UZ": LanguageCode.UZ_CYRL_UZ,
//   "uz-Latn-UZ": LanguageCode.UZ_LATN_UZ
// });

// class FileElement {
//   String? id;
//   int? order;
//   String? url;
//   FileInfo? fileInfo;
//   String? variationId;
//   String? productId;
//   bool? isVisible;

//   FileElement({
//     this.id,
//     this.order,
//     this.url,
//     this.fileInfo,
//     this.variationId,
//     this.productId,
//     this.isVisible,
//   });

//   factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
//         id: json["id"],
//         order: json["order"],
//         url: json["url"],
//         fileInfo: json["fileInfo"] == null
//             ? null
//             : FileInfo.fromJson(json["fileInfo"]),
//         variationId: json["variationId"],
//         productId: json["productId"],
//         isVisible: json["isVisible"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "order": order,
//         "url": url,
//         "fileInfo": fileInfo?.toJson(),
//         "variationId": variationId,
//         "productId": productId,
//         "isVisible": isVisible,
//       };
// }

// class FileInfo {
//   String? id;
//   String? url;
//   String? name;
//   String? extension;
//   String? contentType;
//   DateTime? createdAt;
//   bool? isVisible;

//   FileInfo({
//     this.id,
//     this.url,
//     this.name,
//     this.extension,
//     this.contentType,
//     this.createdAt,
//     this.isVisible,
//   });

//   factory FileInfo.fromJson(Map<String, dynamic> json) => FileInfo(
//         id: json["id"],
//         url: json["url"],
//         name: json["name"],
//         extension: json["extension"],
//         contentType: json["contentType"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         isVisible: json["isVisible"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//         "name": name,
//         "extension": extension,
//         "contentType": contentType,
//         "createdAt": createdAt?.toIso8601String(),
//         "isVisible": isVisible,
//       };
// }

// class Price {
//   int? id;
//   double? value;
//   String? type;
//   int? currencyId;
//   String? variationId;

//   Price({
//     this.id,
//     this.value,
//     this.type,
//     this.currencyId,
//     this.variationId,
//   });

//   factory Price.fromJson(Map<String, dynamic> json) => Price(
//         id: json["id"],
//         value: json["value"],
//         type: json["type"],
//         currencyId: json["currencyId"],
//         variationId: json["variationId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "value": value,
//         "type": type,
//         "currencyId": currencyId,
//         "variationId": variationId,
//       };
// }

// class Product {
//   String? id;
//     String? state;
//     String? name;
//     String? description;
//     int? categoryId;
//     int? organizationId;
//     bool? isVisible;

//   Product({
//     this.id,
//     this.state,
//     this.name,
//     this.description,
//     this.categoryId,
//     this.organizationId,
//     this.isVisible,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         state: json["state"],
//         name: json["name"],
//         description: json["description"],
//         categoryId: json["categoryId"],
//         organizationId: json["organizationId"],
//         isVisible: json["isVisible"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "state": state,
//         "name": name,
//         "description": description,
//         "categoryId": categoryId,
//         "organizationId": organizationId,
//         "isVisible": isVisible,
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
