// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String? id;
  int? state;
  int? service;
  int? tab;
  int? nameId;
  String? name;
  int? descriptionId;
  String? description;
  int? categoryId;
  Category? category;
  int? organizationId;
  String? organizationName;
  List<Variation>? variations;
  bool? isVisible;
  double? rating;
  double? reviewCount;
  int? productNumber;

  ProductModel({
    this.id,
    this.state,
    this.service,
    this.tab,
    this.nameId,
    this.name,
    this.descriptionId,
    this.description,
    this.categoryId,
    this.category,
    this.organizationId,
    this.organizationName,
    this.variations,
    this.isVisible,
    this.rating,
    this.reviewCount,
    this.productNumber,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        state: json["state"],
        service: json["service"],
        tab: json["tab"],
        nameId: json["nameId"],
        name: json["name"],
        descriptionId: json["descriptionId"],
        description: json["description"],
        categoryId: json["categoryId"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        organizationId: json["organizationId"],
        organizationName: json["organizationName"],
        variations: json["variations"] == null
            ? []
            : List<Variation>.from(
                json["variations"]!.map((x) => Variation.fromJson(x))),
        isVisible: json["isVisible"],
        rating: json["rating"],
        reviewCount: json["reviewCount"],
        productNumber: json["productNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state": state,
        "service": service,
        "tab": tab,
        "nameId": nameId,
        "name": name,
        "descriptionId": descriptionId,
        "description": description,
        "categoryId": categoryId,
        "category": category?.toJson(),
        "organizationId": organizationId,
        "organizationName": organizationName,
        "variations": variations == null
            ? []
            : List<dynamic>.from(variations!.map((x) => x.toJson())),
        "isVisible": isVisible,
        "rating": rating,
        "reviewCount": reviewCount,
        "productNumber": productNumber,
      };
}

class Category {
  int? id;
  String? name;
  String? imageId;
  bool? isVisible;

  Category({
    this.id,
    this.name,
    this.imageId,
    this.isVisible,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        imageId: json["imageId"],
        isVisible: json["isVisible"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageId": imageId,
        "isVisible": isVisible,
      };
}

class Variation {
  String? id;
  int? count;
  String? productId;
  List<Price>? prices;
  List<FileElement>? files;
  List<dynamic>? attributeValues;
  bool? isVisible;
  String? moderationStatus;
  bool? compensationOnly;
  int? saleType;
  int? oonModerationStatus;

  Variation({
    this.id,
    this.count,
    this.productId,
    this.prices,
    this.files,
    this.attributeValues,
    this.isVisible,
    this.moderationStatus,
    this.compensationOnly,
    this.saleType,
    this.oonModerationStatus,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["id"],
        count: json["count"],
        productId: json["productId"],
        prices: json["prices"] == null
            ? []
            : List<Price>.from(json["prices"]!.map((x) => Price.fromJson(x))),
        files: json["files"] == null
            ? []
            : List<FileElement>.from(
                json["files"]!.map((x) => FileElement.fromJson(x))),
        attributeValues: json["attributeValues"] == null
            ? []
            : List<dynamic>.from(json["attributeValues"]!.map((x) => x)),
        isVisible: json["isVisible"],
        moderationStatus: json["moderationStatus"],
        compensationOnly: json["compensationOnly"],
        saleType: json["saleType"],
        oonModerationStatus: json["oonModerationStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "productId": productId,
        "prices": prices == null
            ? []
            : List<dynamic>.from(prices!.map((x) => x.toJson())),
        "files": files == null
            ? []
            : List<dynamic>.from(files!.map((x) => x.toJson())),
        "attributeValues": attributeValues == null
            ? []
            : List<dynamic>.from(attributeValues!.map((x) => x)),
        "isVisible": isVisible,
        "moderationStatus": moderationStatus,
        "compensationOnly": compensationOnly,
        "saleType": saleType,
        "oonModerationStatus": oonModerationStatus,
      };
}

class FileElement {
  String? id;
  int? order;
  String? url;
  Map? fileInfo;
  String? variationId;
  String? productId;
  bool? isVisible;

  FileElement({
    this.id,
    this.order,
    this.url,
    this.fileInfo,
    this.variationId,
    this.productId,
    this.isVisible,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        order: json["order"],
        url: json["url"],
        fileInfo: json["fileInfo"],
        variationId: json["variationId"],
        productId: json["productId"],
        isVisible: json["isVisible"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "url": url,
        "fileInfo": fileInfo,
        "variationId": variationId,
        "productId": productId,
        "isVisible": isVisible,
      };
}

class Price {
  int? id;
  double? value;
  String? type;
  int? currencyId;
  String? variationId;

  Price({
    this.id,
    this.value,
    this.type,
    this.currencyId,
    this.variationId,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        id: json["id"],
        value: json["value"],
        type: json["type"],
        currencyId: json["currencyId"],
        variationId: json["variationId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "type": type,
        "currencyId": currencyId,
        "variationId": variationId,
      };
}
