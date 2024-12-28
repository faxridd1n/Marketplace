// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product_model.g.dart';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "state")
  final int state;
  @JsonKey(name: "service")
  final int service;
  @JsonKey(name: "tab")
  final int tab;
  @JsonKey(name: "nameId")
  final int nameId;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "descriptionId")
  final int descriptionId;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "categoryId")
  final int categoryId;
  @JsonKey(name: "category")
  final Category category;
  @JsonKey(name: "organizationId")
  final int organizationId;
  @JsonKey(name: "organizationName")
  final String organizationName;
  @JsonKey(name: "variations")
  final List<Variation> variations;
  @JsonKey(name: "isVisible")
  final bool isVisible;
  @JsonKey(name: "rating")
  final double rating;
  @JsonKey(name: "reviewCount")
  final double reviewCount;
  @JsonKey(name: "productNumber")
  final int productNumber;

  ProductModel({
    this.id = '',
    this.state = -1,
    this.service = -1,
    this.tab = -1,
    this.nameId = -1,
    this.name = '',
    this.descriptionId = -1,
    this.description = '',
    this.categoryId = -1,
    Category? category,
    this.organizationId = -1,
    this.organizationName = '',
    this.variations = const [],
    this.isVisible = false,
    this.rating = -1,
    this.reviewCount = -1,
    this.productNumber = -1,
  }) : category = category ?? Category();

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
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

  Category({
    this.id = -1,
    this.name = '',
    this.imageId = '',
    this.isVisible = false,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Variation {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "productId")
  final String productId;
  @JsonKey(name: "prices")
  final List<Price> prices;
  @JsonKey(name: "files")
  final List<FileElement> files;
  @JsonKey(name: "attributeValues")
  final List<Map> attributeValues;
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

  Variation({
    this.id = '',
    this.count = -1,
    this.productId = '',
    this.prices = const [],
    this.files = const [],
    this.attributeValues = const [],
    this.isVisible = false,
    this.moderationStatus = '',
    this.compensationOnly = false,
    this.saleType = -1,
    this.oonModerationStatus = -1,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => _$VariationFromJson(json);

  Map<String, dynamic> toJson() => _$VariationToJson(this);
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
  final Map fileInfo;
  @JsonKey(name: "variationId")
  final String variationId;
  @JsonKey(name: "productId")
  final String productId;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  FileElement({
    this.id = '',
    this.order = -1,
    this.url = '',
    this.fileInfo = const {},
    this.variationId = '',
    this.productId = '',
    this.isVisible = false,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => _$FileElementFromJson(json);

  Map<String, dynamic> toJson() => _$FileElementToJson(this);
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

class GetProductParams {
  final int sectionId;
  final int categoryId;


  GetProductParams({
    this.sectionId =-1,
    this.categoryId = -1,
  });

  Map<String, dynamic> toJson() {
    final params = <String,dynamic>{};
    if (sectionId != -1) {
      params.putIfAbsent("tab", () => sectionId);
    }
    if (categoryId != -1) {
      params.putIfAbsent("categoryId", () => categoryId);
    }

    return params;
  }
}
